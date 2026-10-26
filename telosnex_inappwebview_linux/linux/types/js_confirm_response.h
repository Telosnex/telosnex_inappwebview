#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_JS_CONFIRM_RESPONSE_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_JS_CONFIRM_RESPONSE_H_

#include <flutter_linux/flutter_linux.h>

namespace telosnex_inappwebview_plugin {

/**
 * Response action for JS confirm dialogs.
 */
// Values match Dart JsConfirmResponseAction (W3b).
enum class JsConfirmResponseAction { CONFIRM = 0, CANCEL = 1 };

/**
 * Response to a JavaScript confirm() dialog.
 */
class JsConfirmResponse {
 public:
  bool handledByClient;
  JsConfirmResponseAction action;

  JsConfirmResponse();
  JsConfirmResponse(FlValue* map);
  ~JsConfirmResponse() = default;
};

}  // namespace telosnex_inappwebview_plugin

#endif  // TELOSNEX_INAPPWEBVIEW_PLUGIN_JS_CONFIRM_RESPONSE_H_
