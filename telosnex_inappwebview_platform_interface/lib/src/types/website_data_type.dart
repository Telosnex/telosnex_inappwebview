import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'website_data_type.g.dart';

///Class that represents a website data type.
@ExchangeableEnum()
class WebsiteDataTypeSpec {
  // ignore: unused_field
  final String _value;
  const WebsiteDataTypeSpec._internal(this._value);

  ///On-disk Fetch caches.
  ///
  ///**NOTE**: available on iOS 11.3+.
  static const WKWebsiteDataTypeFetchCache = WebsiteDataTypeSpec._internal(
    "WKWebsiteDataTypeFetchCache",
  );

  ///On-disk caches.
  static const WKWebsiteDataTypeDiskCache = WebsiteDataTypeSpec._internal(
    "WKWebsiteDataTypeDiskCache",
  );

  ///In-memory caches.
  static const WKWebsiteDataTypeMemoryCache = WebsiteDataTypeSpec._internal(
    "WKWebsiteDataTypeMemoryCache",
  );

  ///HTML offline web application caches.
  static const WKWebsiteDataTypeOfflineWebApplicationCache =
      WebsiteDataTypeSpec._internal(
        "WKWebsiteDataTypeOfflineWebApplicationCache",
      );

  ///Cookies.
  static const WKWebsiteDataTypeCookies = WebsiteDataTypeSpec._internal(
    "WKWebsiteDataTypeCookies",
  );

  ///HTML session storage.
  static const WKWebsiteDataTypeSessionStorage = WebsiteDataTypeSpec._internal(
    "WKWebsiteDataTypeSessionStorage",
  );

  ///HTML local storage.
  static const WKWebsiteDataTypeLocalStorage = WebsiteDataTypeSpec._internal(
    "WKWebsiteDataTypeLocalStorage",
  );

  ///WebSQL databases.
  static const WKWebsiteDataTypeWebSQLDatabases = WebsiteDataTypeSpec._internal(
    "WKWebsiteDataTypeWebSQLDatabases",
  );

  ///IndexedDB databases.
  static const WKWebsiteDataTypeIndexedDBDatabases =
      WebsiteDataTypeSpec._internal("WKWebsiteDataTypeIndexedDBDatabases");

  ///Service worker registrations.
  ///
  ///**NOTE**: available on iOS 11.3+.
  static const WKWebsiteDataTypeServiceWorkerRegistrations =
      WebsiteDataTypeSpec._internal(
        "WKWebsiteDataTypeServiceWorkerRegistrations",
      );

  ///Returns a set of all available website data types.
  @ExchangeableEnumCustomValue()
  // ignore: non_constant_identifier_names
  static final Set<WebsiteDataTypeSpec> ALL = {
    WebsiteDataTypeSpec.WKWebsiteDataTypeFetchCache,
    WebsiteDataTypeSpec.WKWebsiteDataTypeDiskCache,
    WebsiteDataTypeSpec.WKWebsiteDataTypeMemoryCache,
    WebsiteDataTypeSpec.WKWebsiteDataTypeOfflineWebApplicationCache,
    WebsiteDataTypeSpec.WKWebsiteDataTypeCookies,
    WebsiteDataTypeSpec.WKWebsiteDataTypeSessionStorage,
    WebsiteDataTypeSpec.WKWebsiteDataTypeLocalStorage,
    WebsiteDataTypeSpec.WKWebsiteDataTypeWebSQLDatabases,
    WebsiteDataTypeSpec.WKWebsiteDataTypeIndexedDBDatabases,
    WebsiteDataTypeSpec.WKWebsiteDataTypeServiceWorkerRegistrations,
  };
}

///Class that represents a website data type.
///
///**NOTE**: available on iOS 9.0+.
///
///Use [WebsiteDataType] instead.
@Deprecated("Use WebsiteDataType instead")
@ExchangeableEnum()
class IOSWKWebsiteDataTypeSpec {
  // ignore: unused_field
  final String _value;
  const IOSWKWebsiteDataTypeSpec._internal(this._value);

  ///On-disk Fetch caches.
  ///
  ///**NOTE**: available on iOS 11.3+.
  static const WKWebsiteDataTypeFetchCache = IOSWKWebsiteDataTypeSpec._internal(
    "WKWebsiteDataTypeFetchCache",
  );

  ///On-disk caches.
  static const WKWebsiteDataTypeDiskCache = IOSWKWebsiteDataTypeSpec._internal(
    "WKWebsiteDataTypeDiskCache",
  );

  ///In-memory caches.
  static const WKWebsiteDataTypeMemoryCache =
      IOSWKWebsiteDataTypeSpec._internal("WKWebsiteDataTypeMemoryCache");

  ///HTML offline web application caches.
  static const WKWebsiteDataTypeOfflineWebApplicationCache =
      IOSWKWebsiteDataTypeSpec._internal(
        "WKWebsiteDataTypeOfflineWebApplicationCache",
      );

  ///Cookies.
  static const WKWebsiteDataTypeCookies = IOSWKWebsiteDataTypeSpec._internal(
    "WKWebsiteDataTypeCookies",
  );

  ///HTML session storage.
  static const WKWebsiteDataTypeSessionStorage =
      IOSWKWebsiteDataTypeSpec._internal("WKWebsiteDataTypeSessionStorage");

  ///HTML local storage.
  static const WKWebsiteDataTypeLocalStorage =
      IOSWKWebsiteDataTypeSpec._internal("WKWebsiteDataTypeLocalStorage");

  ///WebSQL databases.
  static const WKWebsiteDataTypeWebSQLDatabases =
      IOSWKWebsiteDataTypeSpec._internal("WKWebsiteDataTypeWebSQLDatabases");

  ///IndexedDB databases.
  static const WKWebsiteDataTypeIndexedDBDatabases =
      IOSWKWebsiteDataTypeSpec._internal("WKWebsiteDataTypeIndexedDBDatabases");

  ///Service worker registrations.
  ///
  ///**NOTE**: available on iOS 11.3+.
  static const WKWebsiteDataTypeServiceWorkerRegistrations =
      IOSWKWebsiteDataTypeSpec._internal(
        "WKWebsiteDataTypeServiceWorkerRegistrations",
      );

  ///Returns a set of all available website data types.
  @ExchangeableEnumCustomValue()
  // ignore: non_constant_identifier_names
  static final Set<IOSWKWebsiteDataTypeSpec> ALL = {
    IOSWKWebsiteDataTypeSpec.WKWebsiteDataTypeFetchCache,
    IOSWKWebsiteDataTypeSpec.WKWebsiteDataTypeDiskCache,
    IOSWKWebsiteDataTypeSpec.WKWebsiteDataTypeMemoryCache,
    IOSWKWebsiteDataTypeSpec.WKWebsiteDataTypeOfflineWebApplicationCache,
    IOSWKWebsiteDataTypeSpec.WKWebsiteDataTypeCookies,
    IOSWKWebsiteDataTypeSpec.WKWebsiteDataTypeSessionStorage,
    IOSWKWebsiteDataTypeSpec.WKWebsiteDataTypeLocalStorage,
    IOSWKWebsiteDataTypeSpec.WKWebsiteDataTypeWebSQLDatabases,
    IOSWKWebsiteDataTypeSpec.WKWebsiteDataTypeIndexedDBDatabases,
    IOSWKWebsiteDataTypeSpec.WKWebsiteDataTypeServiceWorkerRegistrations,
  };
}
