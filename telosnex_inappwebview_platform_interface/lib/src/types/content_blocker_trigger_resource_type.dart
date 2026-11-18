import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../content_blocker.dart';

part 'content_blocker_trigger_resource_type.g.dart';

///Class that represents the possible resource type defined for a [ContentBlockerTrigger].
@ExchangeableEnum()
class ContentBlockerTriggerResourceTypeSpec {
  // ignore: unused_field
  final String _value;
  const ContentBlockerTriggerResourceTypeSpec._internal(this._value);

  static const DOCUMENT = ContentBlockerTriggerResourceTypeSpec._internal(
    'document',
  );
  static const IMAGE = ContentBlockerTriggerResourceTypeSpec._internal('image');
  static const STYLE_SHEET = ContentBlockerTriggerResourceTypeSpec._internal(
    'style-sheet',
  );
  static const SCRIPT = ContentBlockerTriggerResourceTypeSpec._internal(
    'script',
  );
  static const FONT = ContentBlockerTriggerResourceTypeSpec._internal('font');
  static const MEDIA = ContentBlockerTriggerResourceTypeSpec._internal('media');
  static const SVG_DOCUMENT = ContentBlockerTriggerResourceTypeSpec._internal(
    'svg-document',
  );

  ///Any untyped load
  static const RAW = ContentBlockerTriggerResourceTypeSpec._internal('raw');
}
