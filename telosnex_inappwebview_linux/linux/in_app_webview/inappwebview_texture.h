#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_INAPPWEBVIEW_TEXTURE_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_INAPPWEBVIEW_TEXTURE_H_

#include <flutter_linux/flutter_linux.h>

G_BEGIN_DECLS

// Declare the custom texture type
#define INAPPWEBVIEW_TYPE_TEXTURE (inappwebview_texture_get_type())

G_DECLARE_FINAL_TYPE(InAppWebViewTexture, inappwebview_texture, INAPPWEBVIEW, TEXTURE,
                     FlPixelBufferTexture)

// Forward declaration
namespace telosnex_inappwebview_plugin {
class InAppWebView;
using WebViewType = InAppWebView;
}  // namespace telosnex_inappwebview_plugin

// Create a new InAppWebViewTexture
InAppWebViewTexture* inappwebview_texture_new(telosnex_inappwebview_plugin::WebViewType* webview);

G_END_DECLS

#endif  // TELOSNEX_INAPPWEBVIEW_PLUGIN_INAPPWEBVIEW_TEXTURE_H_
