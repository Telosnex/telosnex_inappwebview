part of 'main.dart';

void isSecureContext() {
  final shouldSkip = !InAppWebViewController.isMethodSupported(
    PlatformInAppWebViewControllerMethod.isSecureContext,
  );

  var url = !kIsWeb ? TEST_CROSS_PLATFORM_URL_1 : TEST_WEB_PLATFORM_URL_1;

  skippableTestWidgets('isSecureContext', (WidgetTester tester) async {
    final Completer<InAppWebViewController> controllerCompleter =
        Completer<InAppWebViewController>();
    // Not a broadcast stream: that drops a load that ends before the test
    // listens, and example.com can load during the pump below (Linux CI,
    // 11-10). This one keeps each load until the iterator reads it.
    final StreamController<String> pageLoads = StreamController<String>();
    final loads = StreamIterator(pageLoads.stream);

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: InAppWebView(
          key: GlobalKey(),
          initialUrlRequest: URLRequest(url: url),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            pageLoads.add(url!.toString());
          },
          onReceivedError: (controller, request, error) {
            if (request.isForMainFrame ?? true) {
              pageLoads.addError(
                'loading ${request.url} failed: ${error.description}',
              );
            }
          },
        ),
      ),
    );

    final InAppWebViewController controller = await controllerCompleter.future;
    await tester.pump();
    expect(await loads.moveNext(), true);
    expect(await controller.isSecureContext(), true);

    if (!kIsWeb) {
      await controller.loadUrl(
        urlRequest: URLRequest(
          url: WebUri(
            defaultTargetPlatform == TargetPlatform.windows
                ? await _insecureLocalUrl()
                : _insecureTestServerUrl() ?? 'http://example.com/',
          ),
        ),
      );
      expect(await loads.moveNext(), true);
      expect(await controller.isSecureContext(), false);
    }

    await loads.cancel();
    pageLoads.close();
  }, skip: shouldSkip);
}

/// The Node test server at this machine's own network address, for an
/// http page that isn't a secure context. WebView2 (Windows) upgrades http
/// to https where a site has it, so http://example.com/ is secure there, and
/// an external http-only site (neverssl.com) sometimes timed out on CI.
/// http://127.0.0.1 is a secure context (a loopback address); an address of
/// a network interface is not, and WebView2 doesn't upgrade addresses.
Future<String> _insecureLocalUrl() async {
  final interfaces = await NetworkInterface.list(
    type: InternetAddressType.IPv4,
  );
  for (final interface in interfaces) {
    for (final address in interface.addresses) {
      if (!address.isLoopback && !address.isLinkLocal) {
        return 'http://${address.address}:8082/';
      }
    }
  }
  throw StateError('No non-loopback IPv4 address for the test server');
}

// The Node test server over HTTP, unless it is on loopback (a loopback page is
// a secure context). A public HTTP page can be upgraded to HTTPS.
String? _insecureTestServerUrl() {
  final ip = InternetAddress.tryParse(environment['NODE_SERVER_IP'] ?? '');
  return ip == null || ip.isLoopback ? null : 'http://${ip.address}:8082/';
}
