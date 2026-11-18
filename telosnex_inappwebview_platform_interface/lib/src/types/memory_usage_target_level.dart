import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'memory_usage_target_level.g.dart';

///Constants that describe memory usage target levels.
@ExchangeableEnum()
class MemoryUsageTargetLevelSpec {
  // ignore: unused_field
  final int _value;
  const MemoryUsageTargetLevelSpec._internal(this._value);

  ///Normal memory usage target level.
  static const NORMAL = MemoryUsageTargetLevelSpec._internal(0);

  ///Low memory usage target level.
  static const LOW = MemoryUsageTargetLevelSpec._internal(1);
}
