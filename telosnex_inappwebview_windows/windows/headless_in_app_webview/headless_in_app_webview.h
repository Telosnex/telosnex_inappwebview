#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_HEADLESS_IN_APP_WEBVIEW_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_HEADLESS_IN_APP_WEBVIEW_H_

#include "../telosnex_inappwebview_windows_plugin.h"
#include "../in_app_webview/in_app_webview.h"
#include "../types/size_2d.h"
#include "headless_webview_channel_delegate.h"

namespace telosnex_inappwebview_plugin
{
  struct HeadlessInAppWebViewCreationParams {
    const std::string id;
    const std::shared_ptr<Size2D> initialSize;
  };

  class HeadlessInAppWebView
  {
  public:
    static inline const wchar_t* CLASS_NAME = L"HeadlessInAppWebView";
    static inline const std::string METHOD_CHANNEL_NAME_PREFIX = "com.telosnex/flutter_headless_inappwebview_";

    const TelosnexInappwebviewWindowsPlugin* plugin;
    std::string id;
    std::unique_ptr<InAppWebView> webView;
    std::unique_ptr<HeadlessWebViewChannelDelegate> channelDelegate;

    HeadlessInAppWebView(const TelosnexInappwebviewWindowsPlugin* plugin, const HeadlessInAppWebViewCreationParams& params, const HWND parentWindow, std::unique_ptr<InAppWebView> webView);
    ~HeadlessInAppWebView();

    void prepare(const HeadlessInAppWebViewCreationParams& params);
    void setSize(const std::shared_ptr<Size2D> size) const;
    std::shared_ptr<Size2D> getSize() const;
  };
}
#endif //TELOSNEX_INAPPWEBVIEW_PLUGIN_HEADLESS_IN_APP_WEBVIEW_H_