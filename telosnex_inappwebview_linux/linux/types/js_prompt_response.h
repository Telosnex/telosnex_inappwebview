#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_JS_PROMPT_RESPONSE_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_JS_PROMPT_RESPONSE_H_

#include <flutter_linux/flutter_linux.h>

#include <optional>
#include <string>

namespace telosnex_inappwebview_plugin {

/**
 * Response action for JS prompt dialogs.
 */
// Values match Dart JsPromptResponseAction (W3c).
enum class JsPromptResponseAction { CONFIRM = 0, CANCEL = 1 };

/**
 * Response to a JavaScript prompt() dialog.
 */
class JsPromptResponse {
 public:
  bool handledByClient;
  JsPromptResponseAction action;
  std::optional<std::string> value;

  JsPromptResponse();
  JsPromptResponse(FlValue* map);
  ~JsPromptResponse() = default;
};

}  // namespace telosnex_inappwebview_plugin

#endif  // TELOSNEX_INAPPWEBVIEW_PLUGIN_JS_PROMPT_RESPONSE_H_
