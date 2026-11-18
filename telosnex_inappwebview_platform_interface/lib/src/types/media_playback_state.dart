import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'media_playback_state.g.dart';

///Class that describes whether an audio or video presentation is playing, paused, or suspended.
@ExchangeableEnum()
class MediaPlaybackStateSpec {
  // ignore: unused_field
  final int _value;
  const MediaPlaybackStateSpec._internal(this._value);

  ///There is no media to play back.
  static const NONE = MediaPlaybackStateSpec._internal(0);

  ///The media is playing.
  static const PLAYING = MediaPlaybackStateSpec._internal(1);

  ///The media playback is paused.
  static const PAUSED = MediaPlaybackStateSpec._internal(2);

  ///The media is not playing, and cannot be resumed until the user revokes the suspension.
  static const SUSPENDED = MediaPlaybackStateSpec._internal(3);
}
