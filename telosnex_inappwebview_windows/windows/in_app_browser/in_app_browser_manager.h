#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_IN_APP_BROWSER_MANAGER_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_IN_APP_BROWSER_MANAGER_H_

#include <flutter/method_channel.h>
#include <flutter/standard_message_codec.h>
#include <map>
#include <string>

#include "../telosnex_inappwebview_windows_plugin.h"
#include "../types/channel_delegate.h"
#include "in_app_browser.h"

namespace telosnex_inappwebview_plugin
{
  class InAppBrowserManager : public ChannelDelegate
  {
  public:
    static inline const std::string METHOD_CHANNEL_NAME = "com.telosnex/flutter_inappbrowser";

    const TelosnexInappwebviewWindowsPlugin* plugin;
    std::map<std::string, std::unique_ptr<InAppBrowser>> browsers;

    InAppBrowserManager(const TelosnexInappwebviewWindowsPlugin* plugin);
    ~InAppBrowserManager();

    void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue>& method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);

    void createInAppBrowser(const flutter::EncodableMap* arguments);
  };
}
#endif //TELOSNEX_INAPPWEBVIEW_PLUGIN_IN_APP_BROWSER_MANAGER_H_