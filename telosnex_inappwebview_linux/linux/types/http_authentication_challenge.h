#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_HTTP_AUTHENTICATION_CHALLENGE_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_HTTP_AUTHENTICATION_CHALLENGE_H_

#include <flutter_linux/flutter_linux.h>

#include <optional>
#include <string>

#include "url_protection_space.h"

namespace telosnex_inappwebview_plugin {

/**
 * HTTP authentication challenge - sent when server requires authentication.
 */
class HttpAuthenticationChallenge {
 public:
  URLProtectionSpace protectionSpace;
  bool isRetry;

  HttpAuthenticationChallenge(const URLProtectionSpace& protectionSpace, bool isRetry);
  ~HttpAuthenticationChallenge() = default;

  FlValue* toFlValue() const;
};

}  // namespace telosnex_inappwebview_plugin

#endif  // TELOSNEX_INAPPWEBVIEW_PLUGIN_HTTP_AUTHENTICATION_CHALLENGE_H_
