import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'safe_browsing_response.dart';

part 'safe_browsing_response_action.g.dart';

///Class used by [SafeBrowsingResponse] class.
@ExchangeableEnum()
class SafeBrowsingResponseActionSpec {
  // ignore: unused_field
  final int _value;
  const SafeBrowsingResponseActionSpec._internal(this._value);

  ///Act as if the user clicked the "back to safety" button.
  static const BACK_TO_SAFETY = SafeBrowsingResponseActionSpec._internal(0);

  ///Act as if the user clicked the "visit this unsafe site" button.
  static const PROCEED = SafeBrowsingResponseActionSpec._internal(1);

  ///Display the default interstitial.
  static const SHOW_INTERSTITIAL = SafeBrowsingResponseActionSpec._internal(2);
}
