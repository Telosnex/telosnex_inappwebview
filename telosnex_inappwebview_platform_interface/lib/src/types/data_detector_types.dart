import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'data_detector_types.g.dart';

///Class used to specify a `dataDetectoryTypes` value that adds interactivity to web content that matches the value.
@ExchangeableEnum()
class DataDetectorTypesSpec {
  // ignore: unused_field
  final String _value;
  const DataDetectorTypesSpec._internal(this._value);

  ///No detection is performed.
  static const NONE = DataDetectorTypesSpec._internal("NONE");

  ///Phone numbers are detected and turned into links.
  static const PHONE_NUMBER = DataDetectorTypesSpec._internal("PHONE_NUMBER");

  ///URLs in text are detected and turned into links.
  static const LINK = DataDetectorTypesSpec._internal("LINK");

  ///Addresses are detected and turned into links.
  static const ADDRESS = DataDetectorTypesSpec._internal("ADDRESS");

  ///Dates and times that are in the future are detected and turned into links.
  static const CALENDAR_EVENT = DataDetectorTypesSpec._internal(
    "CALENDAR_EVENT",
  );

  ///Tracking numbers are detected and turned into links.
  static const TRACKING_NUMBER = DataDetectorTypesSpec._internal(
    "TRACKING_NUMBER",
  );

  ///Flight numbers are detected and turned into links.
  static const FLIGHT_NUMBER = DataDetectorTypesSpec._internal("FLIGHT_NUMBER");

  ///Lookup suggestions are detected and turned into links.
  static const LOOKUP_SUGGESTION = DataDetectorTypesSpec._internal(
    "LOOKUP_SUGGESTION",
  );

  ///Spotlight suggestions are detected and turned into links.
  static const SPOTLIGHT_SUGGESTION = DataDetectorTypesSpec._internal(
    "SPOTLIGHT_SUGGESTION",
  );

  ///All of the above data types are turned into links when detected. Choosing this value will automatically include any new detection type that is added.
  static const ALL = DataDetectorTypesSpec._internal("ALL");
}

///An iOS-specific class used to specify a `dataDetectoryTypes` value that adds interactivity to web content that matches the value.
///
///**NOTE**: available on iOS 10.0+.
///
///Use [DataDetectorTypes] instead.
@Deprecated("Use DataDetectorTypes instead")
@ExchangeableEnum()
class IOSWKDataDetectorTypesSpec {
  // ignore: unused_field
  final String _value;
  const IOSWKDataDetectorTypesSpec._internal(this._value);

  ///No detection is performed.
  static const NONE = IOSWKDataDetectorTypesSpec._internal("NONE");

  ///Phone numbers are detected and turned into links.
  static const PHONE_NUMBER = IOSWKDataDetectorTypesSpec._internal(
    "PHONE_NUMBER",
  );

  ///URLs in text are detected and turned into links.
  static const LINK = IOSWKDataDetectorTypesSpec._internal("LINK");

  ///Addresses are detected and turned into links.
  static const ADDRESS = IOSWKDataDetectorTypesSpec._internal("ADDRESS");

  ///Dates and times that are in the future are detected and turned into links.
  static const CALENDAR_EVENT = IOSWKDataDetectorTypesSpec._internal(
    "CALENDAR_EVENT",
  );

  ///Tracking numbers are detected and turned into links.
  static const TRACKING_NUMBER = IOSWKDataDetectorTypesSpec._internal(
    "TRACKING_NUMBER",
  );

  ///Flight numbers are detected and turned into links.
  static const FLIGHT_NUMBER = IOSWKDataDetectorTypesSpec._internal(
    "FLIGHT_NUMBER",
  );

  ///Lookup suggestions are detected and turned into links.
  static const LOOKUP_SUGGESTION = IOSWKDataDetectorTypesSpec._internal(
    "LOOKUP_SUGGESTION",
  );

  ///Spotlight suggestions are detected and turned into links.
  static const SPOTLIGHT_SUGGESTION = IOSWKDataDetectorTypesSpec._internal(
    "SPOTLIGHT_SUGGESTION",
  );

  ///All of the above data types are turned into links when detected. Choosing this value will automatically include any new detection type that is added.
  static const ALL = IOSWKDataDetectorTypesSpec._internal("ALL");
}
