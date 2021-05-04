import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'beacon_finder.dart';

extension BeaconFinderExtension on CommonFinders {
  BeaconFinder beacon<B extends Beacon>({bool skipOffstage = true}) =>
      BeaconFinder<B, dynamic>(skipOffstage: skipOffstage);

  Finder get inTestScope => beacon<TestScope>();

  Finder errorBeacon([dynamic error]) => error == null
      ? beacon<ErrorBeacon>()
      : BeaconFinder<ErrorBeacon, dynamic>(
          criteria: (b) => b.error == error,
          description: "ErrorBeacon with $error",
        );

  Finder contentBeacon<T>([T? content]) => content == null
      ? beacon<ContentBeacon<T>>()
      : BeaconFinder<ContentBeacon<T>, T>(
          criteria: (c) => c == content,
          description: "ContentBeacon with $content",
        );

  Finder stateBeacon<T>(T state) => BeaconFinder<StateBeacon<T>, T>(
        criteria: (s) => s == state,
        description: "StateBeacon with state $state",
      );
}

class Beacon<T> extends StatelessWidget {
  final T? tag;

  const Beacon({Key? key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container();
}

class TestScope extends Beacon<Widget> {
  const TestScope({Key? key, required Widget child})
      : super(key: key, tag: child);

  @override
  Widget build(BuildContext context) => tag!;
}

class ErrorBeacon<T> extends Beacon<T> {
  ErrorBeacon(T error, {Key? key}) : super(key: key, tag: error);

  @override
  Widget build(BuildContext context) =>
      tag == null ? Container() : Text("ERROR: $tag");
}

class ContentBeacon<T> extends Beacon<T> {
  ContentBeacon(T content, {Key? key}) : super(key: key, tag: content);

  @override
  Widget build(BuildContext context) =>
      tag == null ? Container() : Text("$tag");
}

class StateBeacon<T> extends Beacon<T> {
  StateBeacon(T state, {Key? key}) : super(key: key, tag: state);
}
