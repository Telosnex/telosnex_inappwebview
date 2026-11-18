import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'in_app_webview_hit_test_result_type.g.dart';

///Class representing the [InAppWebViewHitTestResult] type.
@ExchangeableEnum()
class InAppWebViewHitTestResultTypeSpec {
  // ignore: unused_field
  final int _value;
  const InAppWebViewHitTestResultTypeSpec._internal(this._value);

  ///Default [InAppWebViewHitTestResult], where the target is unknown.
  static const UNKNOWN_TYPE = InAppWebViewHitTestResultTypeSpec._internal(0);

  ///[InAppWebViewHitTestResult] for hitting a phone number.
  static const PHONE_TYPE = InAppWebViewHitTestResultTypeSpec._internal(2);

  ///[InAppWebViewHitTestResult] for hitting a map address.
  static const GEO_TYPE = InAppWebViewHitTestResultTypeSpec._internal(3);

  ///[InAppWebViewHitTestResult] for hitting an email address.
  static const EMAIL_TYPE = InAppWebViewHitTestResultTypeSpec._internal(4);

  ///[InAppWebViewHitTestResult] for hitting an HTML::img tag.
  static const IMAGE_TYPE = InAppWebViewHitTestResultTypeSpec._internal(5);

  ///[InAppWebViewHitTestResult] for hitting a HTML::a tag with src=http.
  static const SRC_ANCHOR_TYPE = InAppWebViewHitTestResultTypeSpec._internal(7);

  ///[InAppWebViewHitTestResult] for hitting a HTML::a tag with src=http + HTML::img.
  static const SRC_IMAGE_ANCHOR_TYPE =
      InAppWebViewHitTestResultTypeSpec._internal(8);

  ///[InAppWebViewHitTestResult] for hitting an edit text area.
  static const EDIT_TEXT_TYPE = InAppWebViewHitTestResultTypeSpec._internal(9);
}
