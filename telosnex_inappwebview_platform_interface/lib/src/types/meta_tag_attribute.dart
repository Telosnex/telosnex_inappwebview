import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'meta_tag.dart';
import 'enum_method.dart';

part 'meta_tag_attribute.g.dart';

///Class that represents an attribute of a `<meta>` HTML tag. It is used by the [MetaTag] class.
@ExchangeableObject()
class MetaTagAttributeSpec {
  ///The attribute name.
  String? name;

  ///The attribute value.
  String? value;

  MetaTagAttributeSpec({this.name, this.value});
}
