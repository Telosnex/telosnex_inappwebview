import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'modal_transition_style.g.dart';

///Class used to specify the transition style when presenting a view controller.
@ExchangeableEnum()
class ModalTransitionStyleSpec {
  // ignore: unused_field
  final int _value;
  const ModalTransitionStyleSpec._internal(this._value);

  ///When the view controller is presented, its view slides up from the bottom of the screen.
  ///On dismissal, the view slides back down. This is the default transition style.
  static const COVER_VERTICAL = ModalTransitionStyleSpec._internal(0);

  ///When the view controller is presented, the current view initiates a horizontal 3D flip from right-to-left,
  ///resulting in the revealing of the new view as if it were on the back of the previous view.
  ///On dismissal, the flip occurs from left-to-right, returning to the original view.
  static const FLIP_HORIZONTAL = ModalTransitionStyleSpec._internal(1);

  ///When the view controller is presented, the current view fades out while the new view fades in at the same time.
  ///On dismissal, a similar type of cross-fade is used to return to the original view.
  static const CROSS_DISSOLVE = ModalTransitionStyleSpec._internal(2);

  ///When the view controller is presented, one corner of the current view curls up to reveal the presented view underneath.
  ///On dismissal, the curled up page unfurls itself back on top of the presented view.
  ///A view controller presented using this transition is itself prevented from presenting any additional view controllers.
  static const PARTIAL_CURL = ModalTransitionStyleSpec._internal(3);
}

///An iOS-specific class used to specify the transition style when presenting a view controller.
///Use [ModalTransitionStyle] instead.
@Deprecated("Use ModalTransitionStyle instead")
@ExchangeableEnum()
class IOSUIModalTransitionStyleSpec {
  // ignore: unused_field
  final int _value;
  const IOSUIModalTransitionStyleSpec._internal(this._value);

  ///When the view controller is presented, its view slides up from the bottom of the screen.
  ///On dismissal, the view slides back down. This is the default transition style.
  static const COVER_VERTICAL = IOSUIModalTransitionStyleSpec._internal(0);

  ///When the view controller is presented, the current view initiates a horizontal 3D flip from right-to-left,
  ///resulting in the revealing of the new view as if it were on the back of the previous view.
  ///On dismissal, the flip occurs from left-to-right, returning to the original view.
  static const FLIP_HORIZONTAL = IOSUIModalTransitionStyleSpec._internal(1);

  ///When the view controller is presented, the current view fades out while the new view fades in at the same time.
  ///On dismissal, a similar type of cross-fade is used to return to the original view.
  static const CROSS_DISSOLVE = IOSUIModalTransitionStyleSpec._internal(2);

  ///When the view controller is presented, one corner of the current view curls up to reveal the presented view underneath.
  ///On dismissal, the curled up page unfurls itself back on top of the presented view.
  ///A view controller presented using this transition is itself prevented from presenting any additional view controllers.
  static const PARTIAL_CURL = IOSUIModalTransitionStyleSpec._internal(3);
}
