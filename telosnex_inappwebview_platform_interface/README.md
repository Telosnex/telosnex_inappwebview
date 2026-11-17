# telosnex_inappwebview_platform_interface

The common platform interface of
[`telosnex_inappwebview`](https://pub.dev/packages/telosnex_inappwebview).
It is part of a fork of [flutter_inappwebview](https://github.com/pichillilorenzo/flutter_inappwebview). For the differences, see the [telosnex_inappwebview README](https://github.com/Telosnex/telosnex_inappwebview#differences-from-flutter_inappwebview).

The app-facing package and each platform package use this interface. Thus,
they support the same API.

## Usage

To add a platform implementation, extend
[`InAppWebViewPlatform`](https://github.com/Telosnex/telosnex_inappwebview/blob/master/telosnex_inappwebview_platform_interface/lib/src/inappwebview_platform.dart).
When the plugin registers, set the instance:
`InAppWebViewPlatform.instance = MyPlatformWebview()`.

## Breaking changes

Prefer a change that does not break other packages, for example a new
method, to a breaking change. See
[platform interface breaking changes](https://flutter.dev/go/platform-interface-breaking-changes).

## Changes

See [CHANGELOG.md](https://github.com/Telosnex/telosnex_inappwebview/blob/master/telosnex_inappwebview_platform_interface/CHANGELOG.md).
