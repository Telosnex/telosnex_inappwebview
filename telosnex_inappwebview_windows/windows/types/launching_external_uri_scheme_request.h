#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_LAUNCHING_EXTERNAL_URI_SCHEME_REQUEST_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_LAUNCHING_EXTERNAL_URI_SCHEME_REQUEST_H_

#include <flutter/standard_method_codec.h>
#include <optional>
#include <string>

#include "../utils/flutter.h"

namespace telosnex_inappwebview_plugin
{
  class LaunchingExternalUriSchemeRequest
  {
  public:
    const std::string uri;
    const std::optional<std::string> initiatingOrigin;
    const std::optional<bool> isUserInitiated;

    LaunchingExternalUriSchemeRequest(const std::string& uri, const std::optional<std::string>& initiatingOrigin,
      const std::optional<bool>& isUserInitiated);
    ~LaunchingExternalUriSchemeRequest() = default;

    flutter::EncodableMap toEncodableMap() const;
  };
}

#endif //TELOSNEX_INAPPWEBVIEW_PLUGIN_LAUNCHING_EXTERNAL_URI_SCHEME_REQUEST_H_