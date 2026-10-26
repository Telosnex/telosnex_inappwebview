import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:telosnex_inappwebview_platform_interface/telosnex_inappwebview_platform_interface.dart';

import 'android/web_storage_manager.dart';
import 'ios/web_storage_manager.dart';

///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager}
///
///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.supported_platforms}
class WebStorageManager {
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager}
  WebStorageManager()
    : this.fromPlatformCreationParams(
        const PlatformWebStorageManagerCreationParams(),
      );

  /// Constructs a [WebStorageManager] from creation params for a specific
  /// platform.
  WebStorageManager.fromPlatformCreationParams(
    PlatformWebStorageManagerCreationParams params,
  ) : this.fromPlatform(PlatformWebStorageManager(params));

  /// Constructs a [WebStorageManager] from a specific platform
  /// implementation.
  WebStorageManager.fromPlatform(this.platform);

  /// Implementation of [PlatformCookieManager] for the current platform.
  final PlatformWebStorageManager platform;

  static WebStorageManager? _instance;

  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformWebStorageManager.static().isClassSupported(platform: platform);

  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isMethodSupported(
    PlatformWebStorageManagerMethod method, {
    TargetPlatform? platform,
  }) => PlatformWebStorageManager.static().isMethodSupported(
    method,
    platform: platform,
  );

  ///Use [WebStorageManager] instead.
  @Deprecated("Use WebStorageManager instead")
  AndroidWebStorageManager android = AndroidWebStorageManager();

  ///Use [WebStorageManager] instead.
  @Deprecated("Use WebStorageManager instead")
  IOSWebStorageManager ios = IOSWebStorageManager();

  ///Gets the [WebStorageManager] shared instance.
  static WebStorageManager instance() {
    if (_instance == null) {
      _instance = WebStorageManager();
    }
    return _instance!;
  }

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.getOrigins}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.getOrigins.supported_platforms}
  Future<List<WebStorageOrigin>> getOrigins() => platform.getOrigins();

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.deleteAllData}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.deleteAllData.supported_platforms}
  Future<void> deleteAllData() => platform.deleteAllData();

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.deleteOrigin}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.deleteOrigin.supported_platforms}
  Future<void> deleteOrigin({required String origin}) =>
      platform.deleteOrigin(origin: origin);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.getQuotaForOrigin}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.getQuotaForOrigin.supported_platforms}
  Future<int> getQuotaForOrigin({required String origin}) =>
      platform.getQuotaForOrigin(origin: origin);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.getUsageForOrigin}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.getUsageForOrigin.supported_platforms}
  Future<int> getUsageForOrigin({required String origin}) =>
      platform.getUsageForOrigin(origin: origin);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.fetchDataRecords}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.fetchDataRecords.supported_platforms}
  Future<List<WebsiteDataRecord>> fetchDataRecords({
    required Set<WebsiteDataType> dataTypes,
  }) => platform.fetchDataRecords(dataTypes: dataTypes);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.removeDataFor}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.removeDataFor.supported_platforms}
  Future<void> removeDataFor({
    required Set<WebsiteDataType> dataTypes,
    required List<WebsiteDataRecord> dataRecords,
  }) => platform.removeDataFor(dataTypes: dataTypes, dataRecords: dataRecords);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.removeDataModifiedSince}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebStorageManager.removeDataModifiedSince.supported_platforms}
  Future<void> removeDataModifiedSince({
    required Set<WebsiteDataType> dataTypes,
    required DateTime date,
  }) => platform.removeDataModifiedSince(dataTypes: dataTypes, date: date);
}
