#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_WEB_RESOURCE_ERROR_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_WEB_RESOURCE_ERROR_H_

#include <flutter_linux/flutter_linux.h>

#include <cstdint>
#include <string>

namespace telosnex_inappwebview_plugin {

class WebResourceError {
 public:
  const std::string description;
  const int64_t type;

  WebResourceError(const std::string& description, int64_t type);
  WebResourceError(FlValue* map);
  ~WebResourceError() = default;

  FlValue* toFlValue() const;
};

}  // namespace telosnex_inappwebview_plugin

#endif  // TELOSNEX_INAPPWEBVIEW_PLUGIN_WEB_RESOURCE_ERROR_H_
