import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/common.dart';
import 'package:integration_test/integration_test.dart';
// The same test_api internals Flutter's web test runner uses.
// ignore: implementation_imports
import 'package:test_api/src/backend/group.dart';
// ignore: implementation_imports
import 'package:test_api/src/backend/invoker.dart';
// ignore: implementation_imports
import 'package:test_api/src/backend/live_test.dart';
// ignore: implementation_imports
import 'package:test_api/src/backend/test.dart' as backend;

Iterable<backend.Test> _tests(Group group) sync* {
  for (final entry in group.entries) {
    if (entry is Group) {
      yield* _tests(entry);
    } else if (entry is backend.Test) {
      yield entry;
    }
  }
}

/// flutter drive (web): integrationDriver reports only what is in
/// [IntegrationTestWidgetsFlutterBinding.results], which gets failures from
/// testWidgets' exception reporter only. A plain test() that fails or times
/// out, or a failing setUp/tearDown, was reported as passing. This records
/// every failed test there, and fails the run if a declared test did not run.
///
/// Call at the root, right after the binding is initialized and before any
/// test is declared. From telosnex's integration_test/web_test_reporting.dart.
void installWebTestReporting(IntegrationTestWidgetsFlutterBinding binding) {
  var declared = <backend.Test>[];
  // Suite.forPlatform clones the declarations; the runner executes the
  // original tree. Matched by full name, as binding.results is.
  final executed = <String, LiveTest>{};
  setUpAll(() {
    declared = _tests(Invoker.current!.liveTest.suite.group).toList();
  });
  // Registered first, so it runs after every other tearDown of a test.
  tearDown(() {
    final live = Invoker.current!.liveTest;
    executed[live.test.name] = live;
  });
  // Root tearDownAlls run in reverse order: this one runs last, before the
  // binding reports.
  tearDownAll(() {
    var notRun = 0;
    for (final test in declared) {
      final live = executed[test.name];
      if (live == null) {
        if (!test.metadata.skip) notRun++;
        continue;
      }
      if (live.state.result.isFailing) {
        binding.results.putIfAbsent(
          test.name,
          () => Failure(test.name, live.errors.join('\n')),
        );
      }
    }
    if (notRun > 0) {
      binding.results['Web test reporting'] = Failure(
        'Web test reporting',
        '$notRun declared tests did not run.',
      );
    }
  });
}
