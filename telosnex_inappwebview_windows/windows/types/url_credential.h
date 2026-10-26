#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_URL_CREDENTIAL_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_URL_CREDENTIAL_H_

#include <flutter/standard_method_codec.h>
#include <optional>
#include <string>

namespace telosnex_inappwebview_plugin
{
  class URLCredential
  {
  public:
    const std::optional<std::string> username;
    const std::optional<std::string> password;

    URLCredential(const std::optional<std::string>& username,
      const std::optional<std::string>& password);
    ~URLCredential() = default;

    flutter::EncodableMap toEncodableMap() const;
  };
}

#endif //TELOSNEX_INAPPWEBVIEW_PLUGIN_URL_CREDENTIAL_H_