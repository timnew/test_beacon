import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'beacon.dart';

class TestScaffold extends StatelessWidget {
  final Widget child;

  TestScaffold({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: TestScope(child: child),
        ),
      );
}

extension WidgetTesterTestScaffoldExtension on WidgetTester {
  Future<void> pumpWidgetOnScaffold(
    Widget widget, [
    Duration? duration,
    EnginePhase phase = EnginePhase.sendSemanticsUpdate,
  ]) =>
      pumpWidget(TestScaffold(child: widget), duration, phase);
}
