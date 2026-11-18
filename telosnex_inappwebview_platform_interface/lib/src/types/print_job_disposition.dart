import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../print_job/main.dart';

part 'print_job_disposition.g.dart';

///Class representing the constants that specify values for the print job disposition of a [PlatformPrintJobController].
@ExchangeableEnum()
class PrintJobDispositionSpec {
  // ignore: unused_field
  final String _value;
  const PrintJobDispositionSpec._internal(this._value);

  ///Normal print job.
  @EnumSupportedPlatforms(platforms: [EnumMacOSPlatform(value: 'spool')])
  static const SPOOL = PrintJobDispositionSpec._internal('SPOOL');

  ///Send to Preview application.
  @EnumSupportedPlatforms(platforms: [EnumMacOSPlatform(value: 'preview')])
  static const PREVIEW = PrintJobDispositionSpec._internal("PREVIEW");

  ///Save to a file.
  @EnumSupportedPlatforms(platforms: [EnumMacOSPlatform(value: 'save')])
  static const SAVE = PrintJobDispositionSpec._internal("SAVE");

  ///Cancel print job.
  @EnumSupportedPlatforms(platforms: [EnumMacOSPlatform(value: 'cancel')])
  static const CANCEL = PrintJobDispositionSpec._internal("CANCEL");
}
