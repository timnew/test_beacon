import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_beacon/test_beacon.dart';

void main() {
  group("Beacon", () {
    final text = "test";

    group("TestScaffold and TestScope beacon", () {
      testWidgets("pumpWidgetOnScaffold builds widget on scaffold",
          (WidgetTester tester) async {
        await tester.pumpWidgetOnScaffold(Text(text));

        find
            .byType(MaterialApp)
            .shouldFindOne()
            .findChild<Scaffold>()
            .shouldFindOne()
            .findChild<TestScope>()
            .shouldFindOne()
            .findChildText(text)
            .shouldFindOne();
      });

      testWidgets("find.inTestScope eliminate ambiouity",
          (WidgetTester tester) async {
        await tester.pumpWidgetOnScaffold(Scaffold());

        find.inTestScope.findChild<Scaffold>().shouldFindOne();
      });
    });
  });
}
