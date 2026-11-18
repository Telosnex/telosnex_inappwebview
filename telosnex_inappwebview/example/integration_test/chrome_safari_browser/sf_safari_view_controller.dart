part of 'main.dart';

void sfSafariViewController() {
  final skipPrewarming = !ChromeSafariBrowser.isMethodSupported(
    PlatformChromeSafariBrowserMethod.prewarmConnections,
  );

  skippableGroup('SF Safari View Controller', () {
    skippableTest('onCompletedInitialLoad did load successfully', () async {
      var chromeSafariBrowser = MyChromeSafariBrowser();
      expect(chromeSafariBrowser.isOpened(), false);

      await chromeSafariBrowser.open(url: testUrl1);
      await expectLater(chromeSafariBrowser.opened.future, completes);
      expect(chromeSafariBrowser.isOpened(), true);
      expect(() async {
        await chromeSafariBrowser.open(url: testCrossPlatformUrl1);
      }, throwsAssertionError);

      expect(await chromeSafariBrowser.firstPageLoaded.future, true);
      await chromeSafariBrowser.close();
      await expectLater(chromeSafariBrowser.closed.future, completes);
      expect(chromeSafariBrowser.isOpened(), false);
    });

    skippableTest('create and invalidate Prewarming Token', () async {
      final prewarmingToken = await ChromeSafariBrowser.prewarmConnections([
        testUrl1,
      ]);
      expect(prewarmingToken, isNotNull);
      await expectLater(
        ChromeSafariBrowser.invalidatePrewarmingToken(prewarmingToken!),
        completes,
      );
    }, skip: skipPrewarming);
  }, skip: kIsWeb || defaultTargetPlatform != TargetPlatform.iOS);
}
