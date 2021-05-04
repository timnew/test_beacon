import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_beacon/test_beacon.dart';

void main() {
  group("Beacon", () {
    testWidgets("build and find beacons", (WidgetTester tester) async {
      await tester.pumpWidget(Column(
        children: [
          Beacon.value(1),
          Beacon.value(2),
          Beacon.value("text"),
        ],
      ));

      find.beacon<Beacon<int>>().shouldFindSome(count: 2);
      find.beacon<Beacon<String>>().shouldFindOne();
      find.beacon().shouldFindSome(count: 3);

      find.beaconWhere<Beacon<int>, int>((tag) => tag == 1).shouldFindOne();
    });
  });
}
