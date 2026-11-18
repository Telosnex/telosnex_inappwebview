import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../content_blocker.dart';

part 'content_blocker_trigger_load_context.g.dart';

///Class that represents the kind of load context that can be used with a [ContentBlockerTrigger].
@ExchangeableEnum()
class ContentBlockerTriggerLoadContextSpec {
  // ignore: unused_field
  final String _value;

  const ContentBlockerTriggerLoadContextSpec._internal(this._value);

  ///Top frame load context
  static const TOP_FRAME = ContentBlockerTriggerLoadContextSpec._internal(
    'top-frame',
  );

  ///Child frame load context
  static const CHILD_FRAME = ContentBlockerTriggerLoadContextSpec._internal(
    'child-frame',
  );
}
