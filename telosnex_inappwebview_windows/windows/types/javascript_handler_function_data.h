#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_JAVASCRIPT_HANDLER_FUNCTION_DATA_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_JAVASCRIPT_HANDLER_FUNCTION_DATA_H_

#include <flutter/standard_method_codec.h>
#include <string>

namespace telosnex_inappwebview_plugin
{
  class JavaScriptHandlerFunctionData
  {
  public:
    const std::string origin;
    const std::string requestUrl;
    const bool isMainFrame;
    const std::string args;

    JavaScriptHandlerFunctionData(const std::string& origin, const std::string& requestUrl, const bool& isMainFrame, const std::string& args);
    JavaScriptHandlerFunctionData(const flutter::EncodableMap& map);
    ~JavaScriptHandlerFunctionData() = default;

    flutter::EncodableMap toEncodableMap() const;
  };
}

#endif //TELOSNEX_INAPPWEBVIEW_PLUGIN_JAVASCRIPT_HANDLER_FUNCTION_DATA_H_