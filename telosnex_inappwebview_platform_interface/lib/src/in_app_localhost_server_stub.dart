import 'platform_in_app_localhost_server.dart';

/// The default server on platforms that cannot open a listening socket.
class DefaultInAppLocalhostServer extends PlatformInAppLocalhostServer {
  DefaultInAppLocalhostServer(super.params) : super.implementation();

  static final _staticValue = DefaultInAppLocalhostServer(
    const PlatformInAppLocalhostServerCreationParams(),
  );

  factory DefaultInAppLocalhostServer.static() => _staticValue;

  @override
  Future<void> start() async {
    throw UnsupportedError('InAppLocalhostServer is not supported on Web.');
  }

  @override
  Future<void> close() async {}

  @override
  bool isRunning() => false;
}
