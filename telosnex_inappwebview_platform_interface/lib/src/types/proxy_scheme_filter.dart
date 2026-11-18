import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../platform_proxy_controller.dart';

part 'proxy_scheme_filter.g.dart';

///Class that represent scheme filters used by [PlatformProxyController].
@ExchangeableEnum()
class ProxySchemeFilterSpec {
  // ignore: unused_field
  final String _value;
  const ProxySchemeFilterSpec._internal(this._value);

  ///Matches all schemes.
  static const MATCH_ALL_SCHEMES = ProxySchemeFilterSpec._internal("*");

  ///HTTP scheme.
  static const MATCH_HTTP = ProxySchemeFilterSpec._internal("http");

  ///HTTPS scheme.
  static const MATCH_HTTPS = ProxySchemeFilterSpec._internal("https");
}
