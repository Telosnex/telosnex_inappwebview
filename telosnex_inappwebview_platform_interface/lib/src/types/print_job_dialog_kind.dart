import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../print_job/main.dart';

part 'print_job_dialog_kind.g.dart';

///Class representing the print dialog kind used by a [PlatformPrintJobController].
@ExchangeableEnum()
class PrintJobDialogKindSpec {
  // ignore: unused_field
  final int _value;
  const PrintJobDialogKindSpec._internal(this._value);

  ///Use the browser print dialog UI.
  static const BROWSER = PrintJobDialogKindSpec._internal(0);

  ///Use the system print dialog UI.
  static const SYSTEM = PrintJobDialogKindSpec._internal(1);
}
