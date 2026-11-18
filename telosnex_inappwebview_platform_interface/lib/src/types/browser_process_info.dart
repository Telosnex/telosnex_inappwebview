import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../webview_environment/platform_webview_environment.dart';
import 'browser_process_kind.dart';
import 'frame_info.dart';
import 'enum_method.dart';

part 'browser_process_info.g.dart';

///An object that contains information for a process in the [PlatformWebViewEnvironment].
@ExchangeableObject()
class BrowserProcessInfoSpec {
  ///The kind of the process.
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  BrowserProcessKindSpec kind;

  ///The process id of the process.
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  int? processId;

  ///A list of associated [FrameInfo]s which are actively running
  ///(showing or hiding UI elements) in the renderer process.
  @SupportedPlatforms(platforms: [WindowsPlatform(available: '1.0.2210.55')])
  List<FrameInfoSpec>? frameInfos;

  BrowserProcessInfoSpec({required this.kind, this.processId, this.frameInfos});
}
