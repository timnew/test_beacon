import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_beacon/test_beacon.dart';

void main() {
  final value = "value";
  final anoterValue = "another";
  group("beacon", () {
    testWidgets("it should find beacon by criteria",
        (WidgetTester tester) async {
      await tester.pumpWidget(Beacon(key: Key(value), value: value));

      find.beacon().shouldFindOne();
      find.beacon(value: value).shouldFindOne();
      find.beacon(value: "none").shouldFindNothing();
      find.beacon(predicate: (b) => b.key == Key(value)).shouldFindOne();
    });

    testWidgets("build nested beacon", (WidgetTester tester) async {
      await tester.pumpWidget(Beacon(
        value: anoterValue,
        child: Beacon(value: value),
      ));

      find.beacon().shouldFindSome(count: 2);

      find
          .beacon(value: anoterValue)
          .shouldFindOne()
          .findChildBeacon(value: value)
          .shouldFindOne();
    });

    testWidgets("type beacon", (WidgetTester tester) async {
      await tester.pumpWidget(Column(
        children: [
          Beacon<String>(value: value),
          Beacon<String>(),
          Beacon(value: value),
          Beacon(),
          Beacon<int>(value: value),
          Beacon<int>()
        ],
      ));

      find.beacon().shouldFindSome(count: 6);
      find.beacon<String>().shouldFindSome(count: 2);
      find.beacon<int>().shouldFindSome(count: 2);
    });
  });

  group("content and error beacon", () {
    testWidgets("content and error", (WidgetTester tester) async {
      await tester.pumpWidget(Column(
        children: [
          ContentBeacon(),
          ContentBeacon(content: value),
          ErrorBeacon(),
          ErrorBeacon(error: value),
          Beacon(),
          Beacon(value: value),
        ],
      ));

      find.contentBeacon().shouldFindSome(count: 2);
      find.errorBeacon().shouldFindSome(count: 2);

      find.contentBeacon(value).shouldFindOne();
      find.errorBeacon(value).shouldFindOne();

      find.beacon(value: value).shouldFindSome(count: 3);
    });
  });

  group("ValueBeacon", () {
    testWidgets("build and find beacons", (WidgetTester tester) async {
      await tester.pumpWidget(Column(
        children: [
          ValueBeacon(1),
          ValueBeacon(2),
          ValueBeacon("text"),
        ],
      ));

      find.beacon<int>().shouldFindSome(count: 2);
      find.beacon<String>().shouldFindOne();
      find.beacon().shouldFindSome(count: 3);

      find.beacon<int>(value: 1).shouldFindOne();
      find.beacon<int>(predicate: (b) => b.value > 1).shouldFindOne();
    });
  });
}
