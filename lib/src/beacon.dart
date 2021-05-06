import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'beacon_finder.dart';

extension BeaconFinderExtension on CommonFinders {
  Finder beacon<T>({
    dynamic value,
    BeaconPredicate? predicate,
    bool skipOffstage = true,
  }) =>
      BeaconFinder<T>(
        skipOffstage: skipOffstage,
        value: value,
        predicate: predicate,
      );

  Finder get inTestScope => beacon<TestScope>();

  Finder errorBeacon([dynamic error]) => beacon<ErrorBeacon>(value: error);

  Finder contentBeacon([dynamic content]) =>
      beacon<ContentBeacon>(value: content);
}

class Beacon<T> extends StatelessWidget {
  final dynamic value;
  final Widget? child;

  const Beacon({
    this.value,
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => child ?? Container();
}

class ValueBeacon<T> extends Beacon<T> {
  ValueBeacon(
    T value, {
    Key? key,
    Widget? child,
  }) : super(value: value, key: key, child: child);
}

class TestScope extends Beacon<TestScope> {
  const TestScope({Key? key, required Widget child})
      : super(key: key, child: child);
}

class ErrorBeacon extends Beacon<ErrorBeacon> {
  const ErrorBeacon({dynamic error, Key? key, Widget? child})
      : super(value: error, key: key, child: child);
}

class ContentBeacon extends Beacon<ContentBeacon> {
  const ContentBeacon({dynamic content, Key? key, Widget? child})
      : super(value: content, key: key, child: child);
}
