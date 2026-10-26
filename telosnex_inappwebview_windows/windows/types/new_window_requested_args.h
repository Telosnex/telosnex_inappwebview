#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_NEW_WINDOW_REQUESTED_ARGS_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_NEW_WINDOW_REQUESTED_ARGS_H_

#include <WebView2.h>
#include <wil/com.h>

namespace telosnex_inappwebview_plugin
{
  class NewWindowRequestedArgs
  {
  public:
    wil::com_ptr<ICoreWebView2NewWindowRequestedEventArgs> args;
    wil::com_ptr<ICoreWebView2Deferral> deferral;

    NewWindowRequestedArgs(wil::com_ptr<ICoreWebView2NewWindowRequestedEventArgs> args, wil::com_ptr<ICoreWebView2Deferral> deferral);
    ~NewWindowRequestedArgs() = default;
  };
}

#endif //TELOSNEX_INAPPWEBVIEW_PLUGIN_NEW_WINDOW_REQUESTED_ARGS_H_