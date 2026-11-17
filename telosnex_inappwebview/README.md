# telosnex_inappwebview

[![pub package](https://img.shields.io/pub/v/telosnex_inappwebview.svg)](https://pub.dev/packages/telosnex_inappwebview)
[![Integration](https://github.com/Telosnex/telosnex_inappwebview/actions/workflows/integration.yml/badge.svg?branch=master)](https://github.com/Telosnex/telosnex_inappwebview/actions/workflows/integration.yml)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/Telosnex/telosnex_inappwebview/blob/master/LICENSE)

A Flutter plugin for an inline webview, a headless webview, and an in-app
browser window. It supports Android, iOS, macOS, Windows, Linux, and Web.

telosnex_inappwebview is a fork of
[flutter_inappwebview](https://github.com/pichillilorenzo/flutter_inappwebview) 6.2.0-beta.3 by Lorenzo Pichilli.
[Telosnex](https://telosnex.com) maintains it. The Dart API is the API of
flutter_inappwebview, so the
[flutter_inappwebview documentation](https://inappwebview.dev/docs/intro)
applies.

## Differences from flutter_inappwebview

- **Names.** Each package has the `telosnex_` prefix. The native names
  changed too: the Android package
  (`com.telosnex.telosnex_inappwebview_android`), the method channels
  (`com.telosnex/...`), the Swift packages, and the plugin classes. Thus, an
  app can contain telosnex_inappwebview and flutter_inappwebview together.
- **JavaScript API of pages.** It did not change. Pages call
  `window.flutter_inappwebview.callHandler(...)`, as before.
- **Linux.** The Linux backend uses WPE WebKit. By default, the build
  downloads a pinned, prebuilt WPE WebKit SDK, checks its SHA-256, and
  bundles it with the app. See
  [telosnex_inappwebview_linux](https://pub.dev/packages/telosnex_inappwebview_linux).
- **iOS and macOS.** The plugin uses Swift Package Manager only. There is no
  CocoaPods podspec. The minimum macOS version is 10.15.
- **Windows.** The plugin builds with Visual Studio 2026 (MSVC 14.5x).
  `WebStorageManager.removeDataModifiedSince` and `zoomBy` are supported.
- **Fixes.** The fork has fixes for each platform. The CHANGELOG of each
  package lists them.
- **Tests.** CI runs the integration tests of the example app on Android,
  iOS, macOS, Windows, Linux, and Chrome, on x64 and arm64.
- **Versions.** The versions start at 1.0.0 and do not follow the versions of
  flutter_inappwebview.

## Migrate from flutter_inappwebview

1. In `pubspec.yaml`, replace `flutter_inappwebview` with
   `telosnex_inappwebview: ^1.0.0`.
2. Replace `package:flutter_inappwebview/flutter_inappwebview.dart` with
   `package:telosnex_inappwebview/telosnex_inappwebview.dart`.
3. If you import a platform package, replace its name too. For example,
   replace `flutter_inappwebview_android` with `telosnex_inappwebview_android`.
4. If `AndroidManifest.xml` declares the file provider of the plugin, change
   two values. The class is
   `com.telosnex.telosnex_inappwebview_android.InAppWebViewFileProvider`. The
   authority is `${applicationId}.telosnex_inappwebview_android.fileprovider`.
5. For iOS and macOS, make sure that Swift Package Manager is enabled:
   `flutter config --enable-swift-package-manager`.

## Requirements

- Dart `^3.8.0` and Flutter 3.32.0 or later.
- Android: `minSdkVersion` 19 or later, and
  [Android Gradle plugin](https://developer.android.com/build/releases/gradle-plugin)
  7.3.0 or later.
- iOS: iOS 12.0 or later, Xcode 15 or later, and Swift Package Manager.
- macOS: macOS 10.15 or later, Xcode 15 or later, and Swift Package Manager.
- Windows: the
  [NuGet CLI](https://learn.microsoft.com/en-us/nuget/install-nuget-client-tools?tabs=windows#nugetexe-cli)
  on `PATH`.
- Linux: CMake 3.19 or later. The pinned WPE WebKit SDK is for Ubuntu 26.04
  (x64 and arm64) and Debian 13 (arm64). For other systems, see
  [telosnex_inappwebview_linux](https://pub.dev/packages/telosnex_inappwebview_linux).

## Documentation

- [flutter_inappwebview documentation](https://inappwebview.dev/docs/intro).
  In its examples, use the `telosnex_inappwebview` package names.
- [API reference](https://pub.dev/documentation/telosnex_inappwebview/latest/).
- Platform setup:
  [Android](https://inappwebview.dev/docs/intro/#setup-android),
  [iOS](https://inappwebview.dev/docs/intro/#setup-ios),
  [macOS](https://inappwebview.dev/docs/intro/#setup-macos),
  [Windows](https://inappwebview.dev/docs/intro/#setup-windows),
  [Web](https://inappwebview.dev/docs/intro/#setup-web).
- [Example app](https://github.com/Telosnex/telosnex_inappwebview/tree/master/telosnex_inappwebview/example) and its
  [integration tests](https://github.com/Telosnex/telosnex_inappwebview/tree/master/telosnex_inappwebview/example/integration_test).

## Packages

| Package | Purpose | Version |
|---|---|---|
| [`telosnex_inappwebview`](https://pub.dev/packages/telosnex_inappwebview) | App-facing package | [![pub](https://img.shields.io/pub/v/telosnex_inappwebview.svg)](https://pub.dev/packages/telosnex_inappwebview) |
| [`telosnex_inappwebview_platform_interface`](https://pub.dev/packages/telosnex_inappwebview_platform_interface) | Platform interface | [![pub](https://img.shields.io/pub/v/telosnex_inappwebview_platform_interface.svg)](https://pub.dev/packages/telosnex_inappwebview_platform_interface) |
| [`telosnex_inappwebview_android`](https://pub.dev/packages/telosnex_inappwebview_android) | Android | [![pub](https://img.shields.io/pub/v/telosnex_inappwebview_android.svg)](https://pub.dev/packages/telosnex_inappwebview_android) |
| [`telosnex_inappwebview_ios`](https://pub.dev/packages/telosnex_inappwebview_ios) | iOS | [![pub](https://img.shields.io/pub/v/telosnex_inappwebview_ios.svg)](https://pub.dev/packages/telosnex_inappwebview_ios) |
| [`telosnex_inappwebview_macos`](https://pub.dev/packages/telosnex_inappwebview_macos) | macOS | [![pub](https://img.shields.io/pub/v/telosnex_inappwebview_macos.svg)](https://pub.dev/packages/telosnex_inappwebview_macos) |
| [`telosnex_inappwebview_windows`](https://pub.dev/packages/telosnex_inappwebview_windows) | Windows | [![pub](https://img.shields.io/pub/v/telosnex_inappwebview_windows.svg)](https://pub.dev/packages/telosnex_inappwebview_windows) |
| [`telosnex_inappwebview_linux`](https://pub.dev/packages/telosnex_inappwebview_linux) | Linux | [![pub](https://img.shields.io/pub/v/telosnex_inappwebview_linux.svg)](https://pub.dev/packages/telosnex_inappwebview_linux) |
| [`telosnex_inappwebview_web`](https://pub.dev/packages/telosnex_inappwebview_web) | Web | [![pub](https://img.shields.io/pub/v/telosnex_inappwebview_web.svg)](https://pub.dev/packages/telosnex_inappwebview_web) |

Add only `telosnex_inappwebview` to an app. The platform packages are
endorsed, so Flutter includes them.

## Maintenance

- Report problems in the
  [issue tracker of this repository](https://github.com/Telosnex/telosnex_inappwebview/issues).
- Each change that users can see gets a line in the `CHANGELOG.md` of its
  package, under `## Unreleased`. A release changes that heading to the new
  version.
- Changes from flutter_inappwebview come in through
  [`tool/rename_upstream.py`](https://github.com/Telosnex/telosnex_inappwebview/blob/master/tool/rename_upstream.py). The script
  applies the rename to them before the merge.

## License and credits

telosnex_inappwebview uses the Apache 2.0 license, as flutter_inappwebview
does. See [LICENSE](https://github.com/Telosnex/telosnex_inappwebview/blob/master/LICENSE).

flutter_inappwebview is the work of Lorenzo Pichilli and its contributors.
To support flutter_inappwebview, see
[inappwebview.dev/donate](https://inappwebview.dev/donate/).

### flutter_inappwebview contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://blog.alexv525.com/"><img src="https://avatars.githubusercontent.com/u/15884415?v=4?s=100" width="100px;" alt="Alex Li"/><br /><sub><b>Alex Li</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=AlexV525" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/crazecoder"><img src="https://avatars.githubusercontent.com/u/18387906?v=4?s=100" width="100px;" alt="1/2"/><br /><sub><b>1/2</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=crazecoder" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/cbodin"><img src="https://avatars.githubusercontent.com/u/220255?v=4?s=100" width="100px;" alt="Christofer Bodin"/><br /><sub><b>Christofer Bodin</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=cbodin" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/matthewlloyd"><img src="https://avatars.githubusercontent.com/u/2041996?v=4?s=100" width="100px;" alt="Matthew Lloyd"/><br /><sub><b>Matthew Lloyd</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=matthewlloyd" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/carloserazo47"><img src="https://avatars.githubusercontent.com/u/83635384?v=4?s=100" width="100px;" alt="C E"/><br /><sub><b>C E</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=carloserazo47" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/robsonmeemo"><img src="https://avatars.githubusercontent.com/u/47990393?v=4?s=100" width="100px;" alt="Robson Araujo"/><br /><sub><b>Robson Araujo</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=robsonmeemo" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/ryanhz"><img src="https://avatars.githubusercontent.com/u/1142612?v=4?s=100" width="100px;" alt="Ryan"/><br /><sub><b>Ryan</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=ryanhz" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://codeeagle.github.io/"><img src="https://avatars.githubusercontent.com/u/2311352?v=4?s=100" width="100px;" alt="CodeEagle"/><br /><sub><b>CodeEagle</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=CodeEagle" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/tneotia"><img src="https://avatars.githubusercontent.com/u/50850142?v=4?s=100" width="100px;" alt="Tanay Neotia"/><br /><sub><b>Tanay Neotia</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=tneotia" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/panndoraBoo"><img src="https://avatars.githubusercontent.com/u/8928207?v=4?s=100" width="100px;" alt="Jamie Joost"/><br /><sub><b>Jamie Joost</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=panndoraBoo" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://deandreamatias.com/"><img src="https://avatars.githubusercontent.com/u/21011641?v=4?s=100" width="100px;" alt="Matias de Andrea"/><br /><sub><b>Matias de Andrea</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=deandreamatias" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://blog.csdn.net/j550341130"><img src="https://avatars.githubusercontent.com/u/17899073?v=4?s=100" width="100px;" alt="YouCii"/><br /><sub><b>YouCii</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=YouCii" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/cutzmf"><img src="https://avatars.githubusercontent.com/u/1662033?v=4?s=100" width="100px;" alt="Salnikov Sergey"/><br /><sub><b>Salnikov Sergey</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=cutzmf" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/a00012025"><img src="https://avatars.githubusercontent.com/u/12824216?v=4?s=100" width="100px;" alt="Po-Jui Chen"/><br /><sub><b>Po-Jui Chen</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=a00012025" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Manuito83"><img src="https://avatars.githubusercontent.com/u/4816367?v=4?s=100" width="100px;" alt="Manuito"/><br /><sub><b>Manuito</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=Manuito83" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/setcy"><img src="https://avatars.githubusercontent.com/u/86180691?v=4?s=100" width="100px;" alt="setcy"/><br /><sub><b>setcy</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=setcy" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/EArminjon2"><img src="https://avatars.githubusercontent.com/u/92172436?v=4?s=100" width="100px;" alt="EArminjon"/><br /><sub><b>EArminjon</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=EArminjon2" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://www.linkedin.com/in/ashank-bharati-497989127/"><img src="https://avatars.githubusercontent.com/u/22197948?v=4?s=100" width="100px;" alt="Ashank Bharati"/><br /><sub><b>Ashank Bharati</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=ashank96" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://dart.art/"><img src="https://avatars.githubusercontent.com/u/1755207?v=4?s=100" width="100px;" alt="Michael Chow"/><br /><sub><b>Michael Chow</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=chownation" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/RodXander"><img src="https://avatars.githubusercontent.com/u/23609784?v=4?s=100" width="100px;" alt="Osvaldo Saez"/><br /><sub><b>Osvaldo Saez</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=RodXander" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/rsydor"><img src="https://avatars.githubusercontent.com/u/79581663?v=4?s=100" width="100px;" alt="rsydor"/><br /><sub><b>rsydor</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=rsydor" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/hoanglm4"><img src="https://avatars.githubusercontent.com/u/7067757?v=4?s=100" width="100px;" alt="Le Minh Hoang"/><br /><sub><b>Le Minh Hoang</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=hoanglm4" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Miiha"><img src="https://avatars.githubusercontent.com/u/3897167?v=4?s=100" width="100px;" alt="Michael Kao"/><br /><sub><b>Michael Kao</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=Miiha" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/cloudygeek"><img src="https://avatars.githubusercontent.com/u/6059542?v=4?s=100" width="100px;" alt="cloudygeek"/><br /><sub><b>cloudygeek</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=cloudygeek" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/chreck"><img src="https://avatars.githubusercontent.com/u/8030398?v=4?s=100" width="100px;" alt="Christoph Eck"/><br /><sub><b>Christoph Eck</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=chreck" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Ser1ous"><img src="https://avatars.githubusercontent.com/u/4497968?v=4?s=100" width="100px;" alt="Ser1ous"/><br /><sub><b>Ser1ous</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=Ser1ous" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://spacelaunchnow.me/"><img src="https://avatars.githubusercontent.com/u/4519230?v=4?s=100" width="100px;" alt="Caleb Jones"/><br /><sub><b>Caleb Jones</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=ItsCalebJones" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://sungazer.io/"><img src="https://avatars.githubusercontent.com/u/6215122?v=4?s=100" width="100px;" alt="Saverio Murgia"/><br /><sub><b>Saverio Murgia</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=savy-91" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/tranductam2802"><img src="https://avatars.githubusercontent.com/u/4957579?v=4?s=100" width="100px;" alt="Trần Đức Tâm"/><br /><sub><b>Trần Đức Tâm</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=tranductam2802" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://pcqpcq.me/"><img src="https://avatars.githubusercontent.com/u/1411571?v=4?s=100" width="100px;" alt="Joker"/><br /><sub><b>Joker</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=pcqpcq" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://www.linkedin.com/in/ycv005/"><img src="https://avatars.githubusercontent.com/u/26734819?v=4?s=100" width="100px;" alt="Yash Chandra Verma"/><br /><sub><b>Yash Chandra Verma</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=ycv005" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/arneke"><img src="https://avatars.githubusercontent.com/u/425235?v=4?s=100" width="100px;" alt="Arne Kepp"/><br /><sub><b>Arne Kepp</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=arneke" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://omralcrt.github.io/"><img src="https://avatars.githubusercontent.com/u/12418327?v=4?s=100" width="100px;" alt="Ömral Cörüt"/><br /><sub><b>Ömral Cörüt</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=omralcrt" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/albatrosify"><img src="https://avatars.githubusercontent.com/u/64252708?v=4?s=100" width="100px;" alt="LrdHelmchen"/><br /><sub><b>LrdHelmchen</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=albatrosify" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://ungapps.com/"><img src="https://avatars.githubusercontent.com/u/8141036?v=4?s=100" width="100px;" alt="Steven Gunanto"/><br /><sub><b>Steven Gunanto</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=gunantosteven" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://schlau.bi/"><img src="https://avatars.githubusercontent.com/u/16060205?v=4?s=100" width="100px;" alt="Michael Rittmeister"/><br /><sub><b>Michael Rittmeister</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=DRSchlaubi" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://aakira.app/"><img src="https://avatars.githubusercontent.com/u/3386962?v=4?s=100" width="100px;" alt="Akira Aratani"/><br /><sub><b>Akira Aratani</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=AAkira" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Doflatango"><img src="https://avatars.githubusercontent.com/u/3091033?v=4?s=100" width="100px;" alt="Doflatango"/><br /><sub><b>Doflatango</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=Doflatango" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Eddayy"><img src="https://avatars.githubusercontent.com/u/17043852?v=4?s=100" width="100px;" alt="Edmund Tay"/><br /><sub><b>Edmund Tay</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=Eddayy" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://andreidiaconu.com/"><img src="https://avatars.githubusercontent.com/u/1402046?v=4?s=100" width="100px;" alt="Andrei Diaconu"/><br /><sub><b>Andrei Diaconu</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=andreidiaconu" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/plateaukao"><img src="https://avatars.githubusercontent.com/u/4084738?v=4?s=100" width="100px;" alt="Daniel Kao"/><br /><sub><b>Daniel Kao</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=plateaukao" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/xtyxtyx"><img src="https://avatars.githubusercontent.com/u/15033141?v=4?s=100" width="100px;" alt="xuty"/><br /><sub><b>xuty</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=xtyxtyx" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://bieker.ninja/"><img src="https://avatars.githubusercontent.com/u/818880?v=4?s=100" width="100px;" alt="Ben Bieker"/><br /><sub><b>Ben Bieker</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=wwwdata" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/phamnhuvu-dev"><img src="https://avatars.githubusercontent.com/u/22906656?v=4?s=100" width="100px;" alt="Phạm Như Vũ"/><br /><sub><b>Phạm Như Vũ</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=phamnhuvu-dev" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/SebastienBtr"><img src="https://avatars.githubusercontent.com/u/18089010?v=4?s=100" width="100px;" alt="SebastienBtr"/><br /><sub><b>SebastienBtr</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=SebastienBtr" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/fattiger00"><img src="https://avatars.githubusercontent.com/u/38494401?v=4?s=100" width="100px;" alt="NeZha"/><br /><sub><b>NeZha</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=fattiger00" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/klydra"><img src="https://avatars.githubusercontent.com/u/40038209?v=4?s=100" width="100px;" alt="Jan Klinge"/><br /><sub><b>Jan Klinge</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=klydra" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/PauloDurrerMelo"><img src="https://avatars.githubusercontent.com/u/29310557?v=4?s=100" width="100px;" alt="PauloDurrerMelo"/><br /><sub><b>PauloDurrerMelo</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=PauloDurrerMelo" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/benmeemo"><img src="https://avatars.githubusercontent.com/u/47991706?v=4?s=100" width="100px;" alt="benmeemo"/><br /><sub><b>benmeemo</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=benmeemo" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/cinos1"><img src="https://avatars.githubusercontent.com/u/19343437?v=4?s=100" width="100px;" alt="cinos"/><br /><sub><b>cinos</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=cinos1" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://xraph.com/"><img src="https://avatars.githubusercontent.com/u/11243590?v=4?s=100" width="100px;" alt="Rex Raphael"/><br /><sub><b>Rex Raphael</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=juicycleff" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Sense545"><img src="https://avatars.githubusercontent.com/u/769406?v=4?s=100" width="100px;" alt="Jan Henrik Høiland"/><br /><sub><b>Jan Henrik Høiland</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=Sense545" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/igtm"><img src="https://avatars.githubusercontent.com/u/6331737?v=4?s=100" width="100px;" alt="Iguchi Tomokatsu"/><br /><sub><b>Iguchi Tomokatsu</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=igtm" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://uekoetter.dev/"><img src="https://avatars.githubusercontent.com/u/1270149?v=4?s=100" width="100px;" alt="Jonas Uekötter"/><br /><sub><b>Jonas Uekötter</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=ueman" title="Documentation">📖</a> <a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=ueman" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/emakar"><img src="https://avatars.githubusercontent.com/u/7767193?v=4?s=100" width="100px;" alt="emakar"/><br /><sub><b>emakar</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=emakar" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://weibo.com/magicrolan"><img src="https://avatars.githubusercontent.com/u/671431?v=4?s=100" width="100px;" alt="liasica"/><br /><sub><b>liasica</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=liasica" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/addie9000"><img src="https://avatars.githubusercontent.com/u/2036910?v=4?s=100" width="100px;" alt="Eiichiro Adachi"/><br /><sub><b>Eiichiro Adachi</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=addie9000" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/kamilpowalowski"><img src="https://avatars.githubusercontent.com/u/83073?v=4?s=100" width="100px;" alt="Kamil Powałowski"/><br /><sub><b>Kamil Powałowski</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=kamilpowalowski" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/akioyamamoto1977"><img src="https://avatars.githubusercontent.com/u/429219?v=4?s=100" width="100px;" alt="Akio Yamamoto"/><br /><sub><b>Akio Yamamoto</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=akioyamamoto1977" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/mohenaxiba"><img src="https://avatars.githubusercontent.com/u/7977540?v=4?s=100" width="100px;" alt="mohenaxiba"/><br /><sub><b>mohenaxiba</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=mohenaxiba" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://www.acidic.co.nz"><img src="https://avatars.githubusercontent.com/u/1319813?v=4?s=100" width="100px;" alt="Ben Anderson"/><br /><sub><b>Ben Anderson</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=bagedevimo" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/daanporon"><img src="https://avatars.githubusercontent.com/u/71901?v=4?s=100" width="100px;" alt="Daan Poron"/><br /><sub><b>Daan Poron</b></sub></a><br /><a href="#security-daanporon" title="Security">🛡️</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://yuki0311.com"><img src="https://avatars.githubusercontent.com/u/34892635?v=4?s=100" width="100px;" alt="ふぁ"/><br /><sub><b>ふぁ</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=fa0311" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/perffecto"><img src="https://avatars.githubusercontent.com/u/2116618?v=4?s=100" width="100px;" alt="perffecto"/><br /><sub><b>perffecto</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=perffecto" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://www.linkedin.com/in/chandra-abdul-fattah"><img src="https://avatars.githubusercontent.com/u/16184998?v=4?s=100" width="100px;" alt="Chandra Abdul Fattah"/><br /><sub><b>Chandra Abdul Fattah</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=chandrabezzo" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://www.bebilica.rs/"><img src="https://avatars.githubusercontent.com/u/41632269?v=4?s=100" width="100px;" alt="Aleksandar Lugonja"/><br /><sub><b>Aleksandar Lugonja</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=LugonjaAleksandar" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://www.hera.cc"><img src="https://avatars.githubusercontent.com/u/534840?v=4?s=100" width="100px;" alt="Alexandre Richonnier"/><br /><sub><b>Alexandre Richonnier</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=heralight" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Sunbreak"><img src="https://avatars.githubusercontent.com/u/7928961?v=4?s=100" width="100px;" alt="Sunbreak"/><br /><sub><b>Sunbreak</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=Sunbreak" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/cslee"><img src="https://avatars.githubusercontent.com/u/590752?v=4?s=100" width="100px;" alt="Eric Lee"/><br /><sub><b>Eric Lee</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=cslee" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/KhatibFX"><img src="https://avatars.githubusercontent.com/u/5616640?v=4?s=100" width="100px;" alt="KhatibFX"/><br /><sub><b>KhatibFX</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=KhatibFX" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://www.guide.inc"><img src="https://avatars.githubusercontent.com/u/106543148?v=4?s=100" width="100px;" alt="Guide.inc"/><br /><sub><b>Guide.inc</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=guide-flutter" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Nirajn2311"><img src="https://avatars.githubusercontent.com/u/36357875?v=4?s=100" width="100px;" alt="Niraj Nandish"/><br /><sub><b>Niraj Nandish</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=Nirajn2311" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/nesquikm"><img src="https://avatars.githubusercontent.com/u/3867874?v=4?s=100" width="100px;" alt="nesquikm"/><br /><sub><b>nesquikm</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=nesquikm" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/andreasgangso"><img src="https://avatars.githubusercontent.com/u/727125?v=4?s=100" width="100px;" alt="Andreas Gangsø"/><br /><sub><b>Andreas Gangsø</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=andreasgangso" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/AlexT84"><img src="https://avatars.githubusercontent.com/u/80742383?v=4?s=100" width="100px;" alt="Alexandru Terente"/><br /><sub><b>Alexandru Terente</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=AlexT84" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/darkang3lz92"><img src="https://avatars.githubusercontent.com/u/33158127?v=4?s=100" width="100px;" alt="Dango Mango"/><br /><sub><b>Dango Mango</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=darkang3lz92" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://medium.com/@m-zimmermann1"><img src="https://avatars.githubusercontent.com/u/72440045?v=4?s=100" width="100px;" alt="Max Zimmermann"/><br /><sub><b>Max Zimmermann</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=maxmitz" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://www.linkedin.com/in/alexandru-dochioiu/"><img src="https://avatars.githubusercontent.com/u/38853913?v=4?s=100" width="100px;" alt="Alexandru Dochioiu"/><br /><sub><b>Alexandru Dochioiu</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=AlexDochioiu" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/YumengNevix"><img src="https://avatars.githubusercontent.com/u/137131451?v=4?s=100" width="100px;" alt="YumengNevix"/><br /><sub><b>YumengNevix</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=YumengNevix" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/lrorpilla"><img src="https://avatars.githubusercontent.com/u/11363922?v=4?s=100" width="100px;" alt="lrorpilla"/><br /><sub><b>lrorpilla</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=lrorpilla" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/michalsrutek"><img src="https://avatars.githubusercontent.com/u/35694712?v=4?s=100" width="100px;" alt="Michal Šrůtek"/><br /><sub><b>Michal Šrůtek</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=michalsrutek" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/daisukeueta"><img src="https://avatars.githubusercontent.com/u/122339799?v=4?s=100" width="100px;" alt="daisukeueta"/><br /><sub><b>daisukeueta</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=daisukeueta" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/gmackall"><img src="https://avatars.githubusercontent.com/u/34871572?v=4?s=100" width="100px;" alt="Gray Mackall"/><br /><sub><b>Gray Mackall</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=gmackall" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/p-mazhnik"><img src="https://avatars.githubusercontent.com/u/25964451?v=4?s=100" width="100px;" alt="Pavel Mazhnik"/><br /><sub><b>Pavel Mazhnik</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=p-mazhnik" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://nlog.dev"><img src="https://avatars.githubusercontent.com/u/20399222?v=4?s=100" width="100px;" alt="nlog (solrin)"/><br /><sub><b>nlog (solrin)</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=nnnlog" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Murmurl912"><img src="https://avatars.githubusercontent.com/u/36264246?v=4?s=100" width="100px;" alt="Murmurl912"/><br /><sub><b>Murmurl912</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=Murmurl912" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/bschulz87"><img src="https://avatars.githubusercontent.com/u/30199362?v=4?s=100" width="100px;" alt="Benjamin Schulz"/><br /><sub><b>Benjamin Schulz</b></sub></a><br /><a href="#ideas-bschulz87" title="Ideas, Planning, & Feedback">🤔</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/ShuheiSuzuki-07"><img src="https://avatars.githubusercontent.com/u/118415919?v=4?s=100" width="100px;" alt="seal-app"/><br /><sub><b>seal-app</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=ShuheiSuzuki-07" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/takuyaaaaaaahaaaaaa"><img src="https://avatars.githubusercontent.com/u/31458194?v=4?s=100" width="100px;" alt="Takuya Tominaga"/><br /><sub><b>Takuya Tominaga</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=takuyaaaaaaahaaaaaa" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/yamaha252"><img src="https://avatars.githubusercontent.com/u/4444068?v=4?s=100" width="100px;" alt="Sergey"/><br /><sub><b>Sergey</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=yamaha252" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/lyb5834"><img src="https://avatars.githubusercontent.com/u/16265810?v=4?s=100" width="100px;" alt="yuanbo li"/><br /><sub><b>yuanbo li</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=lyb5834" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Mecharyry"><img src="https://avatars.githubusercontent.com/u/3380092?v=4?s=100" width="100px;" alt="Ryan Feline"/><br /><sub><b>Ryan Feline</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=Mecharyry" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://fuzzybinary.com"><img src="https://avatars.githubusercontent.com/u/249982?v=4?s=100" width="100px;" alt="Jeff Ward"/><br /><sub><b>Jeff Ward</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=fuzzybinary" title="Tests">⚠️</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://hero.io"><img src="https://avatars.githubusercontent.com/u/33483071?v=4?s=100" width="100px;" alt="Yelzhan Yerkebulan"/><br /><sub><b>Yelzhan Yerkebulan</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=yerkejs" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/GooRingX"><img src="https://avatars.githubusercontent.com/u/167741400?v=4?s=100" width="100px;" alt="GooRingX"/><br /><sub><b>GooRingX</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=GooRingX" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/roberthofstra"><img src="https://avatars.githubusercontent.com/u/1643242?v=4?s=100" width="100px;" alt="Robodoh"/><br /><sub><b>Robodoh</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=roberthofstra" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/imoyakin"><img src="https://avatars.githubusercontent.com/u/7473806?v=4?s=100" width="100px;" alt="imoyakin"/><br /><sub><b>imoyakin</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=imoyakin" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/laishere"><img src="https://avatars.githubusercontent.com/u/23557738?v=4?s=100" width="100px;" alt="laishere"/><br /><sub><b>laishere</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=laishere" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/muccy-timeware"><img src="https://avatars.githubusercontent.com/u/74927063?v=4?s=100" width="100px;" alt="Marco Muccinelli"/><br /><sub><b>Marco Muccinelli</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=muccy-timeware" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/momadvisor"><img src="https://avatars.githubusercontent.com/u/77181890?v=4?s=100" width="100px;" alt="momadvisor"/><br /><sub><b>momadvisor</b></sub></a><br /><a href="https://github.com/pichillilorenzo/flutter_inappwebview/commits?author=momadvisor" title="Code">💻</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This list follows the
[all-contributors](https://github.com/all-contributors/all-contributors)
specification.
