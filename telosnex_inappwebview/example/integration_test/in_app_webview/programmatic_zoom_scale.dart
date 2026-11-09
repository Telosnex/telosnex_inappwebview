part of 'main.dart';

void programmaticZoomScale() {
  final shouldSkip = !InAppWebView.isPropertySupported(
    PlatformWebViewCreationParamsProperty.onZoomScaleChanged,
  );

  skippableGroup('programmatic zoom scale', () {
    final shouldSkipTest1 = !InAppWebViewController.isMethodSupported(
      PlatformInAppWebViewControllerMethod.zoomIn,
    );

    skippableTestWidgets('zoomIn/zoomOut', (WidgetTester tester) async {
      final Completer<InAppWebViewController> controllerCompleter =
          Completer<InAppWebViewController>();
      final Completer<void> pageLoaded = Completer<void>();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: InAppWebView(
            key: GlobalKey(),
            initialUrlRequest: URLRequest(url: TEST_CROSS_PLATFORM_URL_1),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            onLoadStop: (controller, url) {
              pageLoaded.complete();
            },
          ),
        ),
      );

      final InAppWebViewController controller =
          await controllerCompleter.future;
      await pageLoaded.future;
      // The first onLoadStop can come before the page's scale is set, and
      // zoomIn returns false until then.
      var zoomedIn = false;
      for (var i = 0; i < 10 && !zoomedIn; i++) {
        zoomedIn = await controller.zoomIn();
        if (!zoomedIn) await Future.delayed(Duration(milliseconds: 500));
      }
      expect(zoomedIn, true);
      await Future.delayed(Duration(seconds: 1));
      expect(await controller.zoomOut(), true);
    }, skip: shouldSkipTest1);

    skippableTestWidgets(
      'onZoomScaleChanged',
      (WidgetTester tester) async {
        final Completer<InAppWebViewController> controllerCompleter =
            Completer<InAppWebViewController>();
        final Completer<void> pageLoaded = Completer<void>();
        final Completer<void> onZoomScaleChangedCompleter = Completer<void>();

        var listenForScaleChange = false;

        await tester.pumpWidget(
          Directionality(
            textDirection: TextDirection.ltr,
            child: InAppWebView(
              key: GlobalKey(),
              initialUrlRequest: URLRequest(url: TEST_URL_1),
              onWebViewCreated: (controller) {
                controllerCompleter.complete(controller);
              },
              onLoadStop: (controller, url) {
                if (!pageLoaded.isCompleted) {
                  pageLoaded.complete();
                }
              },
              onZoomScaleChanged: (controller, oldScale, newScale) {
                // zoomBy can change the scale more than once (animated).
                if (listenForScaleChange &&
                    !onZoomScaleChangedCompleter.isCompleted) {
                  onZoomScaleChangedCompleter.complete();
                }
              },
            ),
          ),
        );

        final InAppWebViewController controller =
            await controllerCompleter.future;
        await pageLoaded.future;
        listenForScaleChange = true;

        await controller.zoomBy(zoomFactor: 2);

        await expectLater(onZoomScaleChangedCompleter.future, completes);
      },
      skip: !InAppWebViewController.isMethodSupported(
        PlatformInAppWebViewControllerMethod.zoomBy,
      ),
    );

    skippableTestWidgets(
      'zoomBy',
      (WidgetTester tester) async {
        final Completer<InAppWebViewController> controllerCompleter =
            Completer<InAppWebViewController>();
        final Completer<void> pageLoaded = Completer<void>();

        await tester.pumpWidget(
          Directionality(
            textDirection: TextDirection.ltr,
            child: InAppWebView(
              key: GlobalKey(),
              initialUrlRequest: URLRequest(url: TEST_CROSS_PLATFORM_URL_1),
              onWebViewCreated: (controller) {
                controllerCompleter.complete(controller);
              },
              onLoadStop: (controller, url) {
                pageLoaded.complete();
              },
            ),
          ),
        );

        final InAppWebViewController controller =
            await controllerCompleter.future;
        await pageLoaded.future;

        await expectLater(
          controller.zoomBy(zoomFactor: 3.0, animated: true),
          completes,
        );
      },
      skip: !InAppWebViewController.isMethodSupported(
        PlatformInAppWebViewControllerMethod.zoomBy,
      ),
    );

    skippableTestWidgets(
      'getZoomScale',
      (WidgetTester tester) async {
        final Completer<InAppWebViewController> controllerCompleter =
            Completer<InAppWebViewController>();
        final Completer<void> pageLoaded = Completer<void>();

        await tester.pumpWidget(
          Directionality(
            textDirection: TextDirection.ltr,
            child: InAppWebView(
              key: GlobalKey(),
              initialUrlRequest: URLRequest(url: TEST_CROSS_PLATFORM_URL_1),
              onWebViewCreated: (controller) {
                controllerCompleter.complete(controller);
              },
              onLoadStop: (controller, url) {
                pageLoaded.complete();
              },
            ),
          ),
        );

        final InAppWebViewController controller =
            await controllerCompleter.future;
        await pageLoaded.future;

        final scale = await controller.getZoomScale();
        expect(scale, isNonZero);
        expect(scale, isPositive);
      },
      skip: !InAppWebViewController.isMethodSupported(
        PlatformInAppWebViewControllerMethod.getZoomScale,
      ),
    );
  }, skip: shouldSkip);
}
