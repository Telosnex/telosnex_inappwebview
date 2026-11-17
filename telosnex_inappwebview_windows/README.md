# telosnex_inappwebview_windows

The Windows WebView2 implementation of
[`telosnex_inappwebview`](https://pub.dev/packages/telosnex_inappwebview).
It is part of a fork of [flutter_inappwebview](https://github.com/pichillilorenzo/flutter_inappwebview). For the differences, see the [telosnex_inappwebview README](https://github.com/Telosnex/telosnex_inappwebview#differences-from-flutter_inappwebview).

## Usage

This package is
[endorsed](https://docs.flutter.dev/packages-and-plugins/developing-packages#endorsed-federated-plugin).
Add `telosnex_inappwebview` to your app, and Flutter includes this package.
Add this package to `pubspec.yaml` only if you import it directly.

## Requirements

- The [NuGet CLI](https://learn.microsoft.com/en-us/nuget/install-nuget-client-tools?tabs=windows#nugetexe-cli)
  on `PATH`. The build uses it to get WIL and the WebView2 SDK.
- CI builds with Visual Studio 2026 (MSVC 14.5x).

## Changes

See [CHANGELOG.md](https://github.com/Telosnex/telosnex_inappwebview/blob/master/telosnex_inappwebview_windows/CHANGELOG.md).
