import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'search_result_display_style.g.dart';

///Constants that describe the results summary the find panel UI includes.
@ExchangeableEnum()
class SearchResultDisplayStyleSpec {
  // ignore: unused_field
  final int _value;
  const SearchResultDisplayStyleSpec._internal(this._value);

  ///The find panel includes the total number of results the session reports and the index of the target result.
  static const CURRENT_AND_TOTAL = SearchResultDisplayStyleSpec._internal(0);

  ///The find panel includes the total number of results the session reports.
  static const TOTAL = SearchResultDisplayStyleSpec._internal(1);

  ///The find panel doesn’t include the number of results the session reports.
  static const NONE = SearchResultDisplayStyleSpec._internal(2);
}
