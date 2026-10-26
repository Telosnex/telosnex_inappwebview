#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_SAVE_AS_UI_SHOWING_RESPONSE_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_SAVE_AS_UI_SHOWING_RESPONSE_H_

#include <flutter/standard_method_codec.h>
#include <optional>
#include <string>

#include "../utils/flutter.h"
#include "save_as_kind.h"

namespace telosnex_inappwebview_plugin
{
  class SaveAsUIShowingResponse
  {
  public:
    const std::optional<bool> cancel;
    const std::optional<bool> suppressDefaultDialog;
    const std::optional<std::string> saveAsFilePath;
    const std::optional<bool> allowReplace;
    const std::optional<SaveAsKind> kind;

    SaveAsUIShowingResponse(const std::optional<bool>& cancel,
      const std::optional<bool>& suppressDefaultDialog,
      const std::optional<std::string>& saveAsFilePath,
      const std::optional<bool>& allowReplace,
      const std::optional<SaveAsKind>& kind);
    SaveAsUIShowingResponse(const flutter::EncodableMap& map);
    ~SaveAsUIShowingResponse() = default;

    flutter::EncodableMap toEncodableMap() const;
  };
}

#endif //TELOSNEX_INAPPWEBVIEW_PLUGIN_SAVE_AS_UI_SHOWING_RESPONSE_H_