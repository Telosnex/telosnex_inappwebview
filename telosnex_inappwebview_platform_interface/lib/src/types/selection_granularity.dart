import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'selection_granularity.g.dart';

///Class used to set the level of granularity with which the user can interactively select content in the web view.
@ExchangeableEnum()
class SelectionGranularitySpec {
  // ignore: unused_field
  final int _value;
  const SelectionGranularitySpec._internal(this._value);

  ///Selection granularity varies automatically based on the selection.
  static const DYNAMIC = SelectionGranularitySpec._internal(0);

  ///Selection endpoints can be placed at any character boundary.
  static const CHARACTER = SelectionGranularitySpec._internal(1);
}

///An iOS-specific class used to set the level of granularity with which the user can interactively select content in the web view.
///Use [SelectionGranularity] instead.
@Deprecated("Use SelectionGranularity instead")
@ExchangeableEnum()
class IOSWKSelectionGranularitySpec {
  // ignore: unused_field
  final int _value;
  const IOSWKSelectionGranularitySpec._internal(this._value);

  ///Selection granularity varies automatically based on the selection.
  static const DYNAMIC = IOSWKSelectionGranularitySpec._internal(0);

  ///Selection endpoints can be placed at any character boundary.
  static const CHARACTER = IOSWKSelectionGranularitySpec._internal(1);
}
