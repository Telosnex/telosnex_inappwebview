# telosnex_inappwebview_linux

The Linux [WPE WebKit](https://wpewebkit.org/) implementation of
[`telosnex_inappwebview`](https://pub.dev/packages/telosnex_inappwebview).
It is part of a fork of [flutter_inappwebview](https://github.com/pichillilorenzo/flutter_inappwebview). For the differences, see the [telosnex_inappwebview README](https://github.com/Telosnex/telosnex_inappwebview#differences-from-flutter_inappwebview).

## Usage

This package is
[endorsed](https://docs.flutter.dev/packages-and-plugins/developing-packages#endorsed-federated-plugin).
Add `telosnex_inappwebview` to your app, and Flutter includes this package.
Add this package to `pubspec.yaml` only if you import it directly.

## WPE WebKit SDK

The plugin needs WPE WebKit 2.50 or later, built with the WPEPlatform API.
By default, the build downloads a pinned, prebuilt WPE WebKit SDK. It checks
the SHA-256 of the SDK and bundles the SDK with the app. The app then runs
without a WPE WebKit installation.

The pinned SDK has WPE WebKit 2.54.3. There are SDKs for these systems:

- Ubuntu 26.04, x64 and arm64.
- Debian 13, arm64.

An SDK also runs on newer versions of its system. The SDK loads some
packages of the system, for example GStreamer and glib-networking. If one of
these packages is missing, the build names it.

To select a different SDK, set `TELOSNEX_INAPPWEBVIEW_WPE_SDK` as an
environment variable or a CMake cache variable:

| Value | Result |
|---|---|
| (not set) | Download the pinned SDK and bundle it. |
| A directory | Use the extracted SDK in this directory, and bundle it. |
| `system` | Use the WPE WebKit packages of the system through `pkg-config`. Bundle nothing. |

To select the SDK for a different system, set
`TELOSNEX_INAPPWEBVIEW_WPE_SDK_TARGET`, for example `ubuntu-26.04-x64`.

The build needs CMake 3.19 or later to download the SDK.

To build WPE WebKit yourself, see
[WPE_BACKEND.md](https://github.com/Telosnex/telosnex_inappwebview/blob/master/telosnex_inappwebview_linux/WPE_BACKEND.md). The
scripts that build the SDK are in
[wpe_sdk](https://github.com/Telosnex/telosnex_inappwebview/tree/master/telosnex_inappwebview_linux/wpe_sdk).

## Changes

See [CHANGELOG.md](https://github.com/Telosnex/telosnex_inappwebview/blob/master/telosnex_inappwebview_linux/CHANGELOG.md).
