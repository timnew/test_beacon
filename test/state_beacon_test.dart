import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_beacon/test_beacon.dart';

enum TestState {
  idle,
  loading,
  loaded,
  failed,
}

void main() {
  group("State Beacon", () {
    Future<void> buildWidget(
      Future<String>? future,
      WidgetTester tester,
    ) =>
        tester.pumpWidgetOnScaffold(
          FutureBuilder<String>(
            future: future,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty)
                  return StateBeacon(TestState.loaded);
                else
                  return ContentBeacon(snapshot.data!);
              }

              if (snapshot.hasError) {
                return ErrorBeacon(snapshot.error!);
              }

              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return StateBeacon(TestState.idle);
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return StateBeacon(TestState.loading);
                case ConnectionState.done:
                  return StateBeacon(TestState.loaded);
              }
            },
          ),
        );

    testWidgets("build content", (WidgetTester tester) async {
      final completer = Completer<String>.sync();

      await buildWidget(completer.future, tester);

      find.stateBeacon(TestState.loading).shouldFindOne();

      final content = "content";
      completer.complete(content);

      await tester.pump(Duration.zero);

      find.contentBeacon(content).shouldFindOne();
      find.contentBeacon().shouldFindOne();
    });

    testWidgets("build empty", (WidgetTester tester) async {
      final completer = Completer<String>.sync();

      await buildWidget(completer.future, tester);

      find.stateBeacon(TestState.loading).shouldFindOne();

      final content = "";
      completer.complete(content);

      await tester.pump(Duration.zero);

      find.stateBeacon(TestState.loaded).shouldFindOne();
    });

    testWidgets("build error", (WidgetTester tester) async {
      final completer = Completer<String>.sync();

      await buildWidget(completer.future, tester);

      find.stateBeacon(TestState.loading).shouldFindOne();

      final error = "error";
      completer.completeError(error);

      await tester.pump(Duration.zero);

      find.errorBeacon(error).shouldFindOne();
      find.errorBeacon().shouldFindOne();
    });

    testWidgets("build idle", (WidgetTester tester) async {
      await buildWidget(null, tester);

      find.stateBeacon(TestState.idle).shouldFindOne();
    });
  });
}
