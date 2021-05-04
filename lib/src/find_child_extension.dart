import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'beacon.dart';
import 'beacon_finder.dart';

extension FindChildExtension on Finder {
  Finder findChildBeacon<B extends Beacon>({bool skipOffstage = true}) =>
      find.descendant(
        of: this,
        matching: BeaconFinder<B, dynamic>(skipOffstage: skipOffstage),
      );

  Finder findChildBeaconWhere<B extends Beacon<T>, T>(
    BeaconTagCriteria<T> criteria, {
    bool skipOffstage = true,
  }) =>
      find.descendant(
        of: this,
        matching: BeaconFinder<B, T>(
          criteria: criteria,
          skipOffstage: skipOffstage,
        ),
      );

  Finder findChildErrorBeacon([dynamic error]) => find.descendant(
        of: this,
        matching: error == null
            ? BeaconFinder<ErrorBeacon, dynamic>()
            : BeaconFinder<ErrorBeacon, dynamic>(
                criteria: (e) => e == error,
                description: "ErrorBeacon with $error",
              ),
      );

  Finder findChildContentBeacon<T>([T? content]) => find.descendant(
        of: this,
        matching: content == null
            ? BeaconFinder<ContentBeacon<T>, T>()
            : BeaconFinder<ContentBeacon<T>, T>(
                criteria: (c) => c == content,
                description: "ContentBeacon with $content",
              ),
      );

  Finder findChildStateBeacon<T>(T state) => find.descendant(
        of: this,
        matching: BeaconFinder<StateBeacon<T>, T>(
          criteria: (s) => s == state,
          description: "StateBeacon with state $state",
        ),
      );

  Finder findChildBy(Finder finder) =>
      find.descendant(of: this, matching: finder);

  Finder findChildText(String text, {bool skipOffstage = true}) =>
      find.descendant(
          of: this, matching: find.text(text, skipOffstage: skipOffstage));

  Finder findChildWithText<T extends Widget>(String text,
          {bool skipOffstage = true}) =>
      find.descendant(
          of: this,
          matching: find.widgetWithText(T, text, skipOffstage: skipOffstage));

  Finder findChildByKey(Key key, {bool skipOffstage = true}) => find.descendant(
      of: this, matching: find.byKey(key, skipOffstage: skipOffstage));

  Finder findChild<T extends Widget>({bool skipOffstage = true}) =>
      find.descendant(
          of: this, matching: find.byType(T, skipOffstage: skipOffstage));

  Finder findChildIcon(IconData icon, {bool skipOffstage = true}) =>
      find.descendant(
          of: this, matching: find.byIcon(icon, skipOffstage: skipOffstage));

  Finder findChildWithIcon<T extends Widget>(IconData icon,
          {bool skipOffstage = true}) =>
      find.descendant(
          of: this,
          matching: find.widgetWithIcon(T, icon, skipOffstage: skipOffstage));

  Finder findChildByElementType<T extends Element>(Type type,
          {bool skipOffstage = true}) =>
      find.descendant(
          of: this,
          matching: find.byElementType(T, skipOffstage: skipOffstage));

  Finder findChildInstance(Widget widget, {bool skipOffstage = true}) =>
      find.descendant(
          of: this,
          matching: find.byWidget(widget, skipOffstage: skipOffstage));

  Finder findChildByPredicate(WidgetPredicate predicate,
          {String? description, bool skipOffstage = true}) =>
      find.descendant(
        of: this,
        matching: find.byWidgetPredicate(predicate,
            description: description, skipOffstage: skipOffstage),
      );

  Finder findChildByTooltip(String message, {bool skipOffstage = true}) =>
      find.descendant(
          of: this,
          matching: find.byTooltip(message, skipOffstage: skipOffstage));

  Finder findChildByElementPredicate(ElementPredicate predicate,
          {String? description, bool skipOffstage = true}) =>
      find.descendant(
        of: this,
        matching: find.byElementPredicate(predicate,
            description: description, skipOffstage: skipOffstage),
      );

  Finder findChildBySemanticsLabel(Pattern label, {bool skipOffstage = true}) =>
      find.descendant(
          of: this,
          matching: find.bySemanticsLabel(label, skipOffstage: skipOffstage));
}
