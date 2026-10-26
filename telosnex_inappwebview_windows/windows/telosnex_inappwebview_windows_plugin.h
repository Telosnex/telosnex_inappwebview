#ifndef FLUTTER_PLUGIN_TELOSNEX_INAPPWEBVIEW_PLUGIN_PLUGIN_H_
#define FLUTTER_PLUGIN_TELOSNEX_INAPPWEBVIEW_PLUGIN_PLUGIN_H_

#include <flutter/plugin_registrar_windows.h>

namespace telosnex_inappwebview_plugin
{
  class WebViewEnvironmentManager;
  class InAppWebViewManager;
  class InAppBrowserManager;
  class HeadlessInAppWebViewManager;
  class CookieManager;
  class WebStorageManager;
  class PlatformUtil;

  class TelosnexInappwebviewWindowsPlugin : public flutter::Plugin {
  public:
    flutter::PluginRegistrarWindows* registrar;
    std::unique_ptr<WebViewEnvironmentManager> webViewEnvironmentManager;
    std::unique_ptr<InAppWebViewManager> inAppWebViewManager;
    std::unique_ptr<InAppBrowserManager> inAppBrowserManager;
    std::unique_ptr<HeadlessInAppWebViewManager> headlessInAppWebViewManager;
    std::unique_ptr<CookieManager> cookieManager;
    std::unique_ptr<WebStorageManager> webStorageManager;
    std::unique_ptr<PlatformUtil> platformUtil;

    static void RegisterWithRegistrar(flutter::PluginRegistrarWindows* registrar);

    TelosnexInappwebviewWindowsPlugin(flutter::PluginRegistrarWindows* registrar);

    virtual ~TelosnexInappwebviewWindowsPlugin();

    // Disallow copy and assign.
    TelosnexInappwebviewWindowsPlugin(const TelosnexInappwebviewWindowsPlugin&) = delete;
    TelosnexInappwebviewWindowsPlugin& operator=(const TelosnexInappwebviewWindowsPlugin&) = delete;
  private:
    // The ID of the WindowProc delegate registration.
    int window_proc_id = -1;
    std::optional<LRESULT> TelosnexInappwebviewWindowsPlugin::HandleWindowProc(
      HWND hWnd,
      UINT message,
      WPARAM wParam,
      LPARAM lParam);
  };
}
#endif  // FLUTTER_PLUGIN_TELOSNEX_INAPPWEBVIEW_PLUGIN_PLUGIN_H_
