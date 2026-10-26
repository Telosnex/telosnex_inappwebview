import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:telosnex_inappwebview/telosnex_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import '../util.dart';

part 'find_interactions.dart';

void main() {
  final shouldSkip = !FindInteractionController.isClassSupported();

  skippableGroup('FindInteractionController', () {
    findInteractions();
  }, skip: shouldSkip);
}
