import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'download_start_response.dart';

part 'download_start_response_action.g.dart';

///Class representing the action of a [DownloadStartResponse].
@ExchangeableEnum()
class DownloadStartResponseActionSpec {
  // ignore: unused_field
  final int _value;
  const DownloadStartResponseActionSpec._internal(this._value);

  ///Cancel the download.
  @EnumSupportedPlatforms(
    platforms: [EnumWindowsPlatform(value: 0), EnumLinuxPlatform(value: 0)],
  )
  static const CANCEL = DownloadStartResponseActionSpec._internal(0);
}
