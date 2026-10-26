#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_DOWNLOAD_START_RESPONSE_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_DOWNLOAD_START_RESPONSE_H_

#include <flutter_linux/flutter_linux.h>

#include <optional>
#include <string>

namespace telosnex_inappwebview_plugin {

enum class DownloadStartResponseAction { CANCEL = 0, ALLOW = 1 };

class DownloadStartResponse {
 public:
  DownloadStartResponseAction action;
  std::optional<std::string> destinationPath;

  DownloadStartResponse();
  DownloadStartResponse(FlValue* map);
  ~DownloadStartResponse() = default;
};

}  // namespace telosnex_inappwebview_plugin

#endif  // TELOSNEX_INAPPWEBVIEW_PLUGIN_DOWNLOAD_START_RESPONSE_H_
