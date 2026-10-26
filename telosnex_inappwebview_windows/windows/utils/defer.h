#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_UTIL_DEFER_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_UTIL_DEFER_H_

#include <functional>
#include <memory>

namespace telosnex_inappwebview_plugin
{
  static inline std::shared_ptr<void> defer(void* handle, const std::function<void(void*)>& callback)
  {
    return std::shared_ptr<void>(handle, callback);
  }
}

#endif //TELOSNEX_INAPPWEBVIEW_PLUGIN_UTIL_DEFER_H_