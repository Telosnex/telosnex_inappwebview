#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_NEW_WINDOW_REQUESTED_ARGS_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_NEW_WINDOW_REQUESTED_ARGS_H_

#include <WebView2.h>
#include <optional>
#include <string>
#include <wil/com.h>

namespace telosnex_inappwebview_plugin
{
  class NewWindowRequestedArgs
  {
  public:
    wil::com_ptr<ICoreWebView2NewWindowRequestedEventArgs> args;
    wil::com_ptr<ICoreWebView2Deferral> deferral;
    // The webview whose page asked for the window; nullptr once it is gone.
    // The args then must not be used (put_NewWindow ended the app): the new
    // window loads url itself.
    const void* opener = nullptr;
    std::optional<std::string> url;

    NewWindowRequestedArgs(wil::com_ptr<ICoreWebView2NewWindowRequestedEventArgs> args, wil::com_ptr<ICoreWebView2Deferral> deferral);
    ~NewWindowRequestedArgs() = default;
  };
}

#endif //TELOSNEX_INAPPWEBVIEW_PLUGIN_NEW_WINDOW_REQUESTED_ARGS_H_