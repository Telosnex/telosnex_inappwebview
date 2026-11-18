import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'url_request_network_service_type.g.dart';

///Class that represents the constants that specify how a request uses network resources.
@ExchangeableEnum()
class URLRequestNetworkServiceTypeSpec {
  // ignore: unused_field
  final int _value;
  const URLRequestNetworkServiceTypeSpec._internal(this._value);

  ///A service type for standard network traffic.
  static const DEFAULT = URLRequestNetworkServiceTypeSpec._internal(0);

  ///A service type for video traffic.
  static const VIDEO = URLRequestNetworkServiceTypeSpec._internal(2);

  ///A service type for background traffic.
  ///
  ///You should specify this type if your app is performing a download that was not requested by the user—for example,
  ///prefetching content so that it will be available when the user chooses to view it.
  static const BACKGROUND = URLRequestNetworkServiceTypeSpec._internal(3);

  ///A service type for voice traffic.
  static const VOICE = URLRequestNetworkServiceTypeSpec._internal(4);

  ///A service type for data that the user is actively waiting for.
  ///
  ///Use this service type for interactive situations where the user is anticipating a quick response, like instant messaging or completing a purchase.
  static const RESPONSIVE_DATA = URLRequestNetworkServiceTypeSpec._internal(6);

  ///A service type for streaming audio/video data.
  static const AV_STREAMING = URLRequestNetworkServiceTypeSpec._internal(8);

  ///A service type for responsive (time-sensitive) audio/video data.
  static const RESPONSIVE_AV = URLRequestNetworkServiceTypeSpec._internal(9);

  ///A service type for call signaling.
  ///
  ///Use this service type with network traffic that establishes, maintains, or tears down a VoIP call.
  static const CALL_SIGNALING = URLRequestNetworkServiceTypeSpec._internal(11);
}

///An iOS-specific Class that represents the constants that specify how a request uses network resources.
///Use [URLRequestNetworkServiceType] instead.
@Deprecated("Use URLRequestNetworkServiceType instead")
@ExchangeableEnum()
class IOSURLRequestNetworkServiceTypeSpec {
  // ignore: unused_field
  final int _value;
  const IOSURLRequestNetworkServiceTypeSpec._internal(this._value);

  ///A service type for standard network traffic.
  static const DEFAULT = IOSURLRequestNetworkServiceTypeSpec._internal(0);

  ///A service type for video traffic.
  static const VIDEO = IOSURLRequestNetworkServiceTypeSpec._internal(2);

  ///A service type for background traffic.
  ///
  ///You should specify this type if your app is performing a download that was not requested by the user—for example,
  ///prefetching content so that it will be available when the user chooses to view it.
  static const BACKGROUND = IOSURLRequestNetworkServiceTypeSpec._internal(3);

  ///A service type for voice traffic.
  static const VOICE = IOSURLRequestNetworkServiceTypeSpec._internal(4);

  ///A service type for data that the user is actively waiting for.
  ///
  ///Use this service type for interactive situations where the user is anticipating a quick response, like instant messaging or completing a purchase.
  static const RESPONSIVE_DATA = IOSURLRequestNetworkServiceTypeSpec._internal(
    6,
  );

  ///A service type for streaming audio/video data.
  static const AV_STREAMING = IOSURLRequestNetworkServiceTypeSpec._internal(8);

  ///A service type for responsive (time-sensitive) audio/video data.
  static const RESPONSIVE_AV = IOSURLRequestNetworkServiceTypeSpec._internal(9);

  ///A service type for call signaling.
  ///
  ///Use this service type with network traffic that establishes, maintains, or tears down a VoIP call.
  static const CALL_SIGNALING = IOSURLRequestNetworkServiceTypeSpec._internal(
    11,
  );
}
