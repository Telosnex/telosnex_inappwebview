import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'modal_presentation_style.g.dart';

///Class used to specify the modal presentation style when presenting a view controller.
@ExchangeableEnum()
class ModalPresentationStyleSpec {
  // ignore: unused_field
  final int _value;
  const ModalPresentationStyleSpec._internal(this._value);

  ///A presentation style in which the presented view covers the screen.
  static const FULL_SCREEN = ModalPresentationStyleSpec._internal(0);

  ///A presentation style that partially covers the underlying content.
  static const PAGE_SHEET = ModalPresentationStyleSpec._internal(1);

  ///A presentation style that displays the content centered in the screen.
  static const FORM_SHEET = ModalPresentationStyleSpec._internal(2);

  ///A presentation style where the content is displayed over another view controller’s content.
  static const CURRENT_CONTEXT = ModalPresentationStyleSpec._internal(3);

  ///A custom view presentation style that is managed by a custom presentation controller and one or more custom animator objects.
  static const CUSTOM = ModalPresentationStyleSpec._internal(4);

  ///A view presentation style in which the presented view covers the screen.
  static const OVER_FULL_SCREEN = ModalPresentationStyleSpec._internal(5);

  ///A presentation style where the content is displayed over another view controller’s content.
  static const OVER_CURRENT_CONTEXT = ModalPresentationStyleSpec._internal(6);

  ///A presentation style where the content is displayed in a popover view.
  static const POPOVER = ModalPresentationStyleSpec._internal(7);

  ///A presentation style that indicates no adaptations should be made.
  static const NONE = ModalPresentationStyleSpec._internal(8);

  ///The default presentation style chosen by the system.
  ///
  ///**NOTE**: available on iOS 13.0+.
  static const AUTOMATIC = ModalPresentationStyleSpec._internal(9);
}

///An iOS-specific class used to specify the modal presentation style when presenting a view controller.
///Use [ModalPresentationStyle] instead.
@Deprecated("Use ModalPresentationStyle instead")
@ExchangeableEnum()
class IOSUIModalPresentationStyleSpec {
  // ignore: unused_field
  final int _value;
  const IOSUIModalPresentationStyleSpec._internal(this._value);

  ///A presentation style in which the presented view covers the screen.
  static const FULL_SCREEN = IOSUIModalPresentationStyleSpec._internal(0);

  ///A presentation style that partially covers the underlying content.
  static const PAGE_SHEET = IOSUIModalPresentationStyleSpec._internal(1);

  ///A presentation style that displays the content centered in the screen.
  static const FORM_SHEET = IOSUIModalPresentationStyleSpec._internal(2);

  ///A presentation style where the content is displayed over another view controller’s content.
  static const CURRENT_CONTEXT = IOSUIModalPresentationStyleSpec._internal(3);

  ///A custom view presentation style that is managed by a custom presentation controller and one or more custom animator objects.
  static const CUSTOM = IOSUIModalPresentationStyleSpec._internal(4);

  ///A view presentation style in which the presented view covers the screen.
  static const OVER_FULL_SCREEN = IOSUIModalPresentationStyleSpec._internal(5);

  ///A presentation style where the content is displayed over another view controller’s content.
  static const OVER_CURRENT_CONTEXT = IOSUIModalPresentationStyleSpec._internal(
    6,
  );

  ///A presentation style where the content is displayed in a popover view.
  static const POPOVER = IOSUIModalPresentationStyleSpec._internal(7);

  ///A presentation style that indicates no adaptations should be made.
  static const NONE = IOSUIModalPresentationStyleSpec._internal(8);

  ///The default presentation style chosen by the system.
  ///
  ///**NOTE**: available on iOS 13.0+.
  static const AUTOMATIC = IOSUIModalPresentationStyleSpec._internal(9);
}
