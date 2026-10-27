package com.telosnex.telosnex_inappwebview_android.service_worker;

import android.os.Build;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.webkit.ServiceWorkerClientCompat;
import androidx.webkit.ServiceWorkerControllerCompat;
import androidx.webkit.WebViewFeature;

import com.telosnex.telosnex_inappwebview_android.TelosnexInAppWebViewPlugin;
import com.telosnex.telosnex_inappwebview_android.types.Disposable;
import com.telosnex.telosnex_inappwebview_android.types.WebResourceRequestExt;
import com.telosnex.telosnex_inappwebview_android.types.WebResourceResponseExt;

import java.io.ByteArrayInputStream;
import java.util.Map;

import io.flutter.plugin.common.MethodChannel;

@RequiresApi(api = Build.VERSION_CODES.N)
public class ServiceWorkerManager implements Disposable {
  protected static final String LOG_TAG = "ServiceWorkerManager";
  public static final String METHOD_CHANNEL_NAME = "com.telosnex/telosnex_inappwebview_serviceworkercontroller";

  @Nullable
  public ServiceWorkerChannelDelegate channelDelegate;
  @Nullable
  public static ServiceWorkerControllerCompat serviceWorkerController;
  @Nullable
  public TelosnexInAppWebViewPlugin plugin;

  public ServiceWorkerManager(@NonNull final TelosnexInAppWebViewPlugin plugin) {
    this.plugin = plugin;
    final MethodChannel channel = new MethodChannel(plugin.messenger, METHOD_CHANNEL_NAME);
    this.channelDelegate = new ServiceWorkerChannelDelegate(this, channel);
  }

  public static void init() {
    if (serviceWorkerController == null &&
            WebViewFeature.isFeatureSupported(WebViewFeature.SERVICE_WORKER_BASIC_USAGE)) {
      serviceWorkerController = ServiceWorkerControllerCompat.getInstance();
    }
  }
  
  // The manager whose Dart side gets shouldInterceptRequest; null: none.
  @Nullable
  private static volatile ServiceWorkerManager interceptor;
  private static boolean clientSet = false;

  /**
   * One client is set, once: it asks Dart only while a manager wants it.
   * WebView's setServiceWorkerClient waits for the requests in the client it
   * replaces, and such a request waits for the main thread
   * (invokeMethodAndWaitResult): setting a client again from the main thread
   * while a service worker made a request deadlocked the app. Setting it to
   * null crashed the app (flutter_inappwebview issue 1151).
   */
  public void setServiceWorkerClient(Boolean isNull) {
    if (serviceWorkerController == null) {
      return;
    }
    interceptor = isNull ? null : this;
    if (!clientSet) {
      clientSet = true;
      serviceWorkerController.setServiceWorkerClient(ForwardingServiceWorkerClientCompat.INSTANCE);
    }
  }

  private static final class ForwardingServiceWorkerClientCompat extends ServiceWorkerClientCompat {
    static final ServiceWorkerClientCompat INSTANCE = new ForwardingServiceWorkerClientCompat();

    @Nullable
    @Override
    public WebResourceResponse shouldInterceptRequest(@NonNull WebResourceRequest request) {
      final ServiceWorkerManager manager = interceptor;
      final ServiceWorkerChannelDelegate channelDelegate = manager != null ? manager.channelDelegate : null;
      if (channelDelegate == null) {
        return null;
      }
      WebResourceRequestExt requestExt = WebResourceRequestExt.fromWebResourceRequest(request);
      WebResourceResponseExt response;
      try {
        response = channelDelegate.shouldInterceptRequest(requestExt);
      } catch (InterruptedException e) {
        Log.e(LOG_TAG, "", e);
        return null;
      }
      if (response == null) {
        return null;
      }
      String contentType = response.getContentType();
      String contentEncoding = response.getContentEncoding();
      byte[] data = response.getData();
      Map<String, String> responseHeaders = response.getHeaders();
      Integer statusCode = response.getStatusCode();
      String reasonPhrase = response.getReasonPhrase();
      ByteArrayInputStream inputStream = (data != null) ? new ByteArrayInputStream(data) : null;
      if (statusCode != null && reasonPhrase != null) {
        return new WebResourceResponse(contentType, contentEncoding, statusCode, reasonPhrase, responseHeaders, inputStream);
      }
      return new WebResourceResponse(contentType, contentEncoding, inputStream);
    }
  }

  @Override
  public void dispose() {
    if (interceptor == this) {
      interceptor = null;
    }
    if (channelDelegate != null) {
      channelDelegate.dispose();
      channelDelegate = null;
    }
    plugin = null;
  }
}
