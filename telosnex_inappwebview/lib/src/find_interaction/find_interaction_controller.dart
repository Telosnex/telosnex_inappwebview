import 'package:flutter/foundation.dart';
import 'package:telosnex_inappwebview_platform_interface/telosnex_inappwebview_platform_interface.dart';

///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController}
///
///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.supported_platforms}
class FindInteractionController {
  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.supported_platforms}
  FindInteractionController({
    void Function(
      PlatformFindInteractionController controller,
      int activeMatchOrdinal,
      int numberOfMatches,
      bool isDoneCounting,
    )?
    onFindResultReceived,
  }) : this.fromPlatformCreationParams(
         params: PlatformFindInteractionControllerCreationParams(
           onFindResultReceived: onFindResultReceived,
         ),
       );

  /// Constructs a [FindInteractionController].
  ///
  /// See [FindInteractionController.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  FindInteractionController.fromPlatformCreationParams({
    required PlatformFindInteractionControllerCreationParams params,
  }) : this.fromPlatform(platform: PlatformFindInteractionController(params));

  /// Constructs a [FindInteractionController] from a specific platform implementation.
  FindInteractionController.fromPlatform({required this.platform});

  /// Implementation of [PlatformFindInteractionController] for the current platform.
  final PlatformFindInteractionController platform;

  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.onFindResultReceived}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.onFindResultReceived.supported_platforms}
  void Function(
    PlatformFindInteractionController controller,
    int activeMatchOrdinal,
    int numberOfMatches,
    bool isDoneCounting,
  )?
  get onFindResultReceived => platform.onFindResultReceived;

  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.findAll}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.findAll.supported_platforms}
  Future<void> findAll({String? find}) => platform.findAll(find: find);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.findNext}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.findNext.supported_platforms}
  Future<void> findNext({bool forward = true}) =>
      platform.findNext(forward: forward);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.clearMatches}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.clearMatches.supported_platforms}
  Future<void> clearMatches() => platform.clearMatches();

  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.setSearchText}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.setSearchText.supported_platforms}
  Future<void> setSearchText(String? searchText) =>
      platform.setSearchText(searchText);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.getSearchText}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.getSearchText.supported_platforms}
  Future<String?> getSearchText() => platform.getSearchText();

  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.isFindNavigatorVisible}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.isFindNavigatorVisible.supported_platforms}
  Future<bool?> isFindNavigatorVisible() => platform.isFindNavigatorVisible();

  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.updateResultCount}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.updateResultCount.supported_platforms}
  Future<void> updateResultCount() => platform.updateResultCount();

  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.presentFindNavigator}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.presentFindNavigator.supported_platforms}
  Future<void> presentFindNavigator() => platform.presentFindNavigator();

  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.dismissFindNavigator}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.dismissFindNavigator.supported_platforms}
  Future<void> dismissFindNavigator() => platform.dismissFindNavigator();

  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.getActiveFindSession}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.getActiveFindSession.supported_platforms}
  Future<FindSession?> getActiveFindSession() =>
      platform.getActiveFindSession();

  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.dispose}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.dispose.supported_platforms}
  void dispose({bool isKeepAlive = false}) => platform.dispose();

  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionControllerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformFindInteractionController.static().isClassSupported(
        platform: platform,
      );

  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.isPropertySupported}
  static bool isPropertySupported(
    PlatformFindInteractionControllerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => PlatformFindInteractionController.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro telosnex_inappwebview_platform_interface.PlatformFindInteractionController.isMethodSupported}
  static bool isMethodSupported(
    PlatformFindInteractionControllerMethod method, {
    TargetPlatform? platform,
  }) => PlatformFindInteractionController.static().isMethodSupported(
    method,
    platform: platform,
  );
}
