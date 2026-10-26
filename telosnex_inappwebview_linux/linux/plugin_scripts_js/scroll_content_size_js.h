#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_SCROLL_CONTENT_SIZE_JS_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_SCROLL_CONTENT_SIZE_JS_H_

#include <memory>
#include <optional>
#include <string>
#include <vector>

#include "../types/plugin_script.h"
#include "javascript_bridge_js.h"

namespace telosnex_inappwebview_plugin {

// onScrollChanged and onContentSizeChanged. WPE WebKit has no signal for
// either: the page reports its scroll position (at most once a frame) and the
// size of its content (when it changes).
class ScrollContentSizeJS {
 public:
  inline static const std::string GROUP_NAME =
      "IN_APP_WEBVIEW_SCROLL_CONTENT_SIZE_JS_PLUGIN_SCRIPT";

  static std::string SOURCE() {
    const std::string bridge = "window." + JavaScriptBridgeJS::get_JAVASCRIPT_BRIDGE_NAME();
    return R"JS(
(function() {
  var scheduled = false;
  window.addEventListener('scroll', function() {
    if (scheduled) return;
    scheduled = true;
    window.requestAnimationFrame(function() {
      scheduled = false;
      try {
        )JS" + bridge + R"JS(.callHandler('onScrollChanged',
            {x: Math.round(window.scrollX), y: Math.round(window.scrollY)});
      } catch (_) {}
    });
  }, {passive: true});

  var width = 0, height = 0;
  function report() {
    var e = document.documentElement;
    if (e == null) return;
    var w = e.scrollWidth, h = e.scrollHeight;
    if (w === width && h === height) return;
    var old = {width: width, height: height};
    width = w; height = h;
    try {
      )JS" + bridge + R"JS(.callHandler('onContentSizeChanged',
          {oldContentSize: old, newContentSize: {width: w, height: h}});
    } catch (_) {}
  }
  function observe() {
    report();
    if (typeof ResizeObserver === 'function' && document.documentElement != null) {
      new ResizeObserver(report).observe(document.documentElement);
      if (document.body != null) new ResizeObserver(report).observe(document.body);
    }
  }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', observe);
  } else {
    observe();
  }
  window.addEventListener('load', report);
})();
)JS";
  }

  static std::unique_ptr<PluginScript> PLUGIN_SCRIPT(
      const std::optional<std::vector<std::string>>& allowedOriginRules) {
    return std::make_unique<PluginScript>(GROUP_NAME, SOURCE(),
                                          UserScriptInjectionTime::atDocumentStart,
                                          true,  // forMainFrameOnly
                                          allowedOriginRules,
                                          nullptr,  // contentWorld
                                          true,     // requiredInAllContentWorlds
                                          std::vector<std::string>{});
  }
};

}  // namespace telosnex_inappwebview_plugin

#endif  // TELOSNEX_INAPPWEBVIEW_PLUGIN_SCROLL_CONTENT_SIZE_JS_H_
