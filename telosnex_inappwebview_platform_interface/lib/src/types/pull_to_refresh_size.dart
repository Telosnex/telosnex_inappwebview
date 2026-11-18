import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'pull_to_refresh_size.g.dart';

///Class representing the size of the refresh indicator.
@ExchangeableEnum()
class PullToRefreshSizeSpec {
  // ignore: unused_field
  final int _value;
  const PullToRefreshSizeSpec._internal(this._value);

  ///Default size.
  static const DEFAULT = PullToRefreshSizeSpec._internal(1);

  ///Large size.
  static const LARGE = PullToRefreshSizeSpec._internal(0);
}

///Android-specific class representing the size of the refresh indicator.
///Use [PullToRefreshSize] instead.
@Deprecated("Use PullToRefreshSize instead")
@ExchangeableEnum()
class AndroidPullToRefreshSizeSpec {
  // ignore: unused_field
  final int _value;
  const AndroidPullToRefreshSizeSpec._internal(this._value);

  ///Default size.
  static const DEFAULT = AndroidPullToRefreshSizeSpec._internal(1);

  ///Large size.
  static const LARGE = AndroidPullToRefreshSizeSpec._internal(0);
}
