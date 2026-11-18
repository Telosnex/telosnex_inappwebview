import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../in_app_webview/in_app_webview_settings.dart';

part 'layout_algorithm.g.dart';

///Class used to set the underlying layout algorithm.
@ExchangeableEnum()
class LayoutAlgorithmSpec {
  // ignore: unused_field
  final String _value;
  const LayoutAlgorithmSpec._internal(this._value);

  ///NORMAL means no rendering changes. This is the recommended choice for maximum compatibility across different platforms and Android versions.
  static const NORMAL = LayoutAlgorithmSpec._internal("NORMAL");

  ///TEXT_AUTOSIZING boosts font size of paragraphs based on heuristics to make the text readable when viewing a wide-viewport layout in the overview mode.
  ///It is recommended to enable zoom support [InAppWebViewSettings.supportZoom] when using this mode.
  ///
  ///**NOTE**: available on Android 19+.
  static const TEXT_AUTOSIZING = LayoutAlgorithmSpec._internal(
    "TEXT_AUTOSIZING",
  );

  ///NARROW_COLUMNS makes all columns no wider than the screen if possible. Only use this for API levels prior to `Build.VERSION_CODES.KITKAT`.
  static const NARROW_COLUMNS = LayoutAlgorithmSpec._internal("NARROW_COLUMNS");
}

///An Android-specific class used to set the underlying layout algorithm.
///Use [LayoutAlgorithm] instead.
@Deprecated("Use LayoutAlgorithm instead")
@ExchangeableEnum()
class AndroidLayoutAlgorithmSpec {
  // ignore: unused_field
  final String _value;
  const AndroidLayoutAlgorithmSpec._internal(this._value);

  ///NORMAL means no rendering changes. This is the recommended choice for maximum compatibility across different platforms and Android versions.
  static const NORMAL = AndroidLayoutAlgorithmSpec._internal("NORMAL");

  ///TEXT_AUTOSIZING boosts font size of paragraphs based on heuristics to make the text readable when viewing a wide-viewport layout in the overview mode.
  ///It is recommended to enable zoom support [InAppWebViewOptions.supportZoom] when using this mode.
  ///
  ///**NOTE**: available on Android 19+.
  static const TEXT_AUTOSIZING = AndroidLayoutAlgorithmSpec._internal(
    "TEXT_AUTOSIZING",
  );

  ///NARROW_COLUMNS makes all columns no wider than the screen if possible. Only use this for API levels prior to `Build.VERSION_CODES.KITKAT`.
  static const NARROW_COLUMNS = AndroidLayoutAlgorithmSpec._internal(
    "NARROW_COLUMNS",
  );
}
