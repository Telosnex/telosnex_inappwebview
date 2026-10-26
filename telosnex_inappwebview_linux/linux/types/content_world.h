#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_CONTENT_WORLD_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_CONTENT_WORLD_H_

#include <flutter_linux/flutter_linux.h>

#include <memory>
#include <optional>
#include <string>

namespace telosnex_inappwebview_plugin {

/**
 * Represents a content world for JavaScript execution isolation.
 * WebKitGTK doesn't have full content world isolation like WKWebView,
 * but we can track the concept for API compatibility.
 */
class ContentWorld {
 public:
  std::string name;

  ContentWorld(const std::string& name);
  ContentWorld(FlValue* map);

  FlValue* toFlValue() const;

  bool operator==(const ContentWorld& other) const;

  // Factory methods for well-known content worlds
  static std::shared_ptr<ContentWorld> page();
  static std::shared_ptr<ContentWorld> defaultClient();
  static std::shared_ptr<ContentWorld> world(const std::string& name);

  // The world name for WebKit: nullptr for the page world ("page", or
  // none), which is WebKit's default world; else a named isolated world
  // ("defaultClient" too, isolated from the page as on iOS and macOS).
  static const char* webkitName(const std::optional<std::string>& name) {
    if (!name.has_value() || name->empty() || *name == "page") {
      return nullptr;
    }
    return name->c_str();
  }

 private:
  static std::shared_ptr<ContentWorld> pageWorld_;
  static std::shared_ptr<ContentWorld> defaultClientWorld_;
};

}  // namespace telosnex_inappwebview_plugin

#endif  // TELOSNEX_INAPPWEBVIEW_PLUGIN_CONTENT_WORLD_H_
