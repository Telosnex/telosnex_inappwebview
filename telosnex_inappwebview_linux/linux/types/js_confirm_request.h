#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_JS_CONFIRM_REQUEST_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_JS_CONFIRM_REQUEST_H_

#include <flutter_linux/flutter_linux.h>

#include <optional>
#include <string>

namespace telosnex_inappwebview_plugin {

/**
 * Represents a JavaScript confirm() dialog request.
 */
class JsConfirmRequest {
 public:
  std::optional<std::string> url;
  std::string message;
  bool isMainFrame;

  JsConfirmRequest(const std::optional<std::string>& url, const std::string& message,
                   bool isMainFrame);
  ~JsConfirmRequest() = default;

  FlValue* toFlValue() const;
};

}  // namespace telosnex_inappwebview_plugin

#endif  // TELOSNEX_INAPPWEBVIEW_PLUGIN_JS_CONFIRM_REQUEST_H_
