part of 'main.dart';

void videoPlaybackPolicy() {
  // IAW_NO_VIDEO: CI's Android emulator (no GPU) crashed decoding this
  // H.264 video: the emulator process exited in this group in 3 runs, even
  // with its hardware decoder off, and every later group failed with it.
  // These tests still run locally and on devices. The value is read as a
  // string: bool.fromEnvironment is true only for "true", and CI passes 1.
  final shouldSkip =
      const String.fromEnvironment('IAW_NO_VIDEO') == '1' ||
      !InAppWebViewSettings.isPropertySupported(
        InAppWebViewSettingsProperty.mediaPlaybackRequiresUserGesture,
      );

  skippableGroup('Video playback policy', () {
    String videoTestBase64 = "";
    setUpAll(() async {
      final ByteData videoData = await rootBundle.load(
        'test_assets/sample_video.mp4',
      );
      final String base64VideoData = base64Encode(
        Uint8List.view(videoData.buffer),
      );
      final String videoTest =
          '''
        <!DOCTYPE html><html>
        <head><title>Video auto play</title>
          <script type="text/javascript">
            function play() {
              var video = document.getElementById("video");
              video.play();
            }
            function isPaused() {
              var video = document.getElementById("video");
              return video.paused;
            }
            function exitFullscreen() {
              // iPhone plays video fullscreen natively, which only the
              // video element ends.
              var video = document.getElementById('video');
              if (video && video.webkitDisplayingFullscreen && video.webkitExitFullscreen) {
                video.webkitExitFullscreen();
              } else if (document.exitFullscreen) {
                document.exitFullscreen();
              } else if (document.webkitExitFullscreen) {
                document.webkitExitFullscreen();
              } else if (document.msExitFullscreen) {
                document.msExitFullscreen();
              }
            }
          </script>
        </head>
        <body onload="play();">
        <video controls playsinline autoplay id="video">
          <source src="data:video/mp4;charset=utf-8;base64,$base64VideoData">
        </video>
        </body>
        </html>
      ''';
      videoTestBase64 = base64Encode(const Utf8Encoder().convert(videoTest));
    });

    skippableTestWidgets('Auto media playback', (WidgetTester tester) async {
      Completer<InAppWebViewController> controllerCompleter =
          Completer<InAppWebViewController>();
      Completer<void> pageLoaded = Completer<void>();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: InAppWebView(
            key: GlobalKey(),
            initialUrlRequest: URLRequest(
              url: WebUri(
                'data:text/html;charset=utf-8;base64,$videoTestBase64',
              ),
            ),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            initialSettings: InAppWebViewSettings(
              javaScriptEnabled: true,
              mediaPlaybackRequiresUserGesture: false,
            ),
            onLoadStop: (controller, url) {
              pageLoaded.complete();
            },
          ),
        ),
      );
      await _pumpUntil(tester, pageLoaded);
      InAppWebViewController controller = await controllerCompleter.future;

      // Autoplay starts a moment after the load: up to 10 s.
      bool isPaused = true;
      for (var i = 0; i < 50 && isPaused; i++) {
        await tester.pump();
        isPaused = await controller.evaluateJavascript(source: 'isPaused();');
        if (isPaused) await Future.delayed(const Duration(milliseconds: 200));
      }
      expect(isPaused, false);

      controllerCompleter = Completer<InAppWebViewController>();
      pageLoaded = Completer<void>();

      // We change the key to re-create a new webview as we change the mediaPlaybackRequiresUserGesture
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: InAppWebView(
            key: GlobalKey(),
            initialUrlRequest: URLRequest(
              url: WebUri(
                'data:text/html;charset=utf-8;base64,$videoTestBase64',
              ),
            ),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            initialSettings: InAppWebViewSettings(
              javaScriptEnabled: true,
              mediaPlaybackRequiresUserGesture: true,
            ),
            onLoadStop: (controller, url) {
              pageLoaded.complete();
            },
          ),
        ),
      );

      // On screen, so the video is paused by the policy, not by WebKit.
      await _pumpUntil(tester, pageLoaded);
      controller = await controllerCompleter.future;

      isPaused = await controller.evaluateJavascript(source: 'isPaused();');
      expect(isPaused, true);
    });

    final shouldSkipTest2 = !InAppWebViewSettings.isPropertySupported(
      InAppWebViewSettingsProperty.allowsInlineMediaPlayback,
    );

    skippableTestWidgets(
      'Video plays inline when allowsInlineMediaPlayback is true',
      (WidgetTester tester) async {
        Completer<InAppWebViewController> controllerCompleter =
            Completer<InAppWebViewController>();
        Completer<void> pageLoaded = Completer<void>();
        Completer<void> onEnterFullscreenCompleter = Completer<void>();

        await tester.pumpWidget(
          Directionality(
            textDirection: TextDirection.ltr,
            child: InAppWebView(
              key: GlobalKey(),
              initialUrlRequest: URLRequest(
                url: WebUri(
                  'data:text/html;charset=utf-8;base64,$videoTestBase64',
                ),
              ),
              onWebViewCreated: (controller) {
                controllerCompleter.complete(controller);
              },
              initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
                mediaPlaybackRequiresUserGesture: false,
                allowsInlineMediaPlayback: true,
              ),
              onLoadStop: (controller, url) {
                pageLoaded.complete();
              },
              onEnterFullscreen: (controller) {
                onEnterFullscreenCompleter.complete();
              },
            ),
          ),
        );

        await _pumpUntil(tester, pageLoaded);
        expect(onEnterFullscreenCompleter.future, doesNotComplete);
      },
      skip: shouldSkipTest2,
    );

    final shouldSkipTest3 = !InAppWebViewSettings.isPropertySupported(
      InAppWebViewSettingsProperty.allowsInlineMediaPlayback,
    );

    skippableTestWidgets(
      'Video plays fullscreen when allowsInlineMediaPlayback is false',
      (WidgetTester tester) async {
        Completer<InAppWebViewController> controllerCompleter =
            Completer<InAppWebViewController>();
        Completer<void> pageLoaded = Completer<void>();
        Completer<void> onEnterFullscreenCompleter = Completer<void>();

        await tester.pumpWidget(
          Directionality(
            textDirection: TextDirection.ltr,
            child: InAppWebView(
              key: GlobalKey(),
              initialUrlRequest: URLRequest(
                url: WebUri(
                  'data:text/html;charset=utf-8;base64,$videoTestBase64',
                ),
              ),
              onWebViewCreated: (controller) {
                controllerCompleter.complete(controller);
              },
              initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
                mediaPlaybackRequiresUserGesture: false,
                allowsInlineMediaPlayback: false,
              ),
              onLoadStop: (controller, url) {
                pageLoaded.complete();
              },
              onEnterFullscreen: (controller) {
                onEnterFullscreenCompleter.complete();
              },
            ),
          ),
        );

        await _pumpUntil(tester, pageLoaded);
        await _pumpUntil(tester, onEnterFullscreenCompleter);
      },
      skip: shouldSkipTest3,
    );

    // iOS 26 (simulator): nothing ends native fullscreen video from code,
    // neither webkitExitFullscreen() nor closeAllMediaPresentations, so
    // there is no exit to report.
    final shouldSkipTest4 =
        !InAppWebViewSettings.isPropertySupported(
          InAppWebViewSettingsProperty.allowsInlineMediaPlayback,
        ) ||
        (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS);
    // on Android, entering fullscreen requires user interaction
    skippableTestWidgets('exit fullscreen event', (WidgetTester tester) async {
      Completer<InAppWebViewController> controllerCompleter =
          Completer<InAppWebViewController>();
      Completer<void> pageLoaded = Completer<void>();
      Completer<void> onEnterFullscreenCompleter = Completer<void>();
      Completer<void> onExitFullscreenCompleter = Completer<void>();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: InAppWebView(
            key: GlobalKey(),
            initialUrlRequest: URLRequest(
              url: WebUri(
                'data:text/html;charset=utf-8;base64,$videoTestBase64',
              ),
            ),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            initialSettings: InAppWebViewSettings(
              javaScriptEnabled: true,
              mediaPlaybackRequiresUserGesture: false,
              allowsInlineMediaPlayback: false,
            ),
            onLoadStop: (controller, url) {
              pageLoaded.complete();
            },
            onEnterFullscreen: (controller) {
              if (!onEnterFullscreenCompleter.isCompleted) {
                onEnterFullscreenCompleter.complete();
              }
            },
            onExitFullscreen: (controller) {
              if (!onExitFullscreenCompleter.isCompleted) {
                onExitFullscreenCompleter.complete();
              }
            },
          ),
        ),
      );

      await _pumpUntil(tester, pageLoaded);
      InAppWebViewController controller = await controllerCompleter.future;

      // The video goes fullscreen some time after it starts (iOS 26: it
      // starts inline). Exit once it is.
      await _pumpUntil(tester, onEnterFullscreenCompleter);
      await controller.evaluateJavascript(source: "exitFullscreen();");

      await expectLater(onExitFullscreenCompleter.future, completes);
    }, skip: shouldSkipTest4);
  }, skip: shouldSkip);
}

/// Pumps until [done] completes. On iOS the native web view goes on screen
/// only in a frame after it is created, and the test draws a frame only on
/// pump. WebKit holds the video of a web view that is not on screen, and
/// does not start an autoplay it held once the view shows.
Future<void> _pumpUntil(WidgetTester tester, Completer<void> done) async {
  while (!done.isCompleted) {
    await tester.pump();
    await Future.delayed(const Duration(milliseconds: 100));
  }
}
