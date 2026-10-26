#include "web_view_transport.h"

#include "../in_app_webview/in_app_webview.h"

namespace telosnex_inappwebview_plugin {

WebKitWebView* WebViewTransport::getWebKitWebView() const {
  if (inAppWebView) {
    return inAppWebView->webview();
  }
  return nullptr;
}

}  // namespace telosnex_inappwebview_plugin
