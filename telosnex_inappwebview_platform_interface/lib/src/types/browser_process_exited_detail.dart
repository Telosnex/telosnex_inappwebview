import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../webview_environment/platform_webview_environment.dart';
import 'browser_process_exit_kind.dart';
import 'enum_method.dart';

part 'browser_process_exited_detail.g.dart';

///An object that contains information for the [PlatformWebViewEnvironment.onBrowserProcessExited] event.
@ExchangeableObject()
class BrowserProcessExitedDetailSpec {
  ///The kind of browser process exit that has occurred.
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  BrowserProcessExitKindSpec kind;

  ///The process ID of the browser process that has exited.
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  int? processId;

  BrowserProcessExitedDetailSpec({required this.kind, this.processId});
}
