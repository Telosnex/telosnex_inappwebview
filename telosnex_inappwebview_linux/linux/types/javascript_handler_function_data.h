#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_JAVASCRIPT_HANDLER_FUNCTION_DATA_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_JAVASCRIPT_HANDLER_FUNCTION_DATA_H_

#include <flutter_linux/flutter_linux.h>

#include <string>

namespace telosnex_inappwebview_plugin {

class JavaScriptHandlerFunctionData {
 public:
  const std::string origin;
  const std::string requestUrl;
  const bool isMainFrame;
  const std::string args;

  JavaScriptHandlerFunctionData(const std::string& origin, const std::string& requestUrl,
                                bool isMainFrame, const std::string& args);
  JavaScriptHandlerFunctionData(FlValue* map);
  ~JavaScriptHandlerFunctionData() = default;

  FlValue* toFlValue() const;
};

}  // namespace telosnex_inappwebview_plugin

#endif  // TELOSNEX_INAPPWEBVIEW_PLUGIN_JAVASCRIPT_HANDLER_FUNCTION_DATA_H_
