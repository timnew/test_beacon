import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'beacon.dart';
import 'beacon_finder.dart';

extension FindAncestorExtension on Finder {
  Finder findAncestorBeacon<B extends Beacon>({bool skipOffstage = true}) =>
      find.ancestor(
        of: this,
        matching: BeaconFinder<B, dynamic>(skipOffstage: skipOffstage),
      );

  Finder findAncestorBeaconWhere<B extends Beacon<T>, T>(
    BeaconTagCriteria<T> criteria, {
    bool skipOffstage = true,
  }) =>
      find.ancestor(
        of: this,
        matching: BeaconFinder<B, T>(
          criteria: criteria,
          skipOffstage: skipOffstage,
        ),
      );

  Finder findAncestorBy(Finder finder) =>
      find.ancestor(of: this, matching: finder);

  Finder findAncestorText(String text, {bool skipOffstage = true}) =>
      find.ancestor(
        of: this,
        matching: find.text(text, skipOffstage: skipOffstage),
      );

  Finder findAncestorWithText<T extends Widget>(
    String text, {
    bool skipOffstage = true,
  }) =>
      find.ancestor(
        of: this,
        matching: find.widgetWithText(T, text, skipOffstage: skipOffstage),
      );

  Finder findAncestorByKey(Key key, {bool skipOffstage = true}) =>
      find.ancestor(
          of: this, matching: find.byKey(key, skipOffstage: skipOffstage));

  Finder findAncestor<T extends Widget>({bool skipOffstage = true}) => find
      .ancestor(of: this, matching: find.byType(T, skipOffstage: skipOffstage));

  Finder findAncestorIcon(IconData icon, {bool skipOffstage = true}) =>
      find.ancestor(
        of: this,
        matching: find.byIcon(icon, skipOffstage: skipOffstage),
      );

  Finder findAncestorWithIcon<T extends Widget>(
    IconData icon, {
    bool skipOffstage = true,
  }) =>
      find.ancestor(
        of: this,
        matching: find.widgetWithIcon(T, icon, skipOffstage: skipOffstage),
      );

  Finder findAncestorByElementType<T extends Element>(
    Type type, {
    bool skipOffstage = true,
  }) =>
      find.ancestor(
        of: this,
        matching: find.byElementType(T, skipOffstage: skipOffstage),
      );

  Finder findAncestorInstance(Widget widget, {bool skipOffstage = true}) =>
      find.ancestor(
        of: this,
        matching: find.byWidget(widget, skipOffstage: skipOffstage),
      );

  Finder findAncestorByPredicate(
    WidgetPredicate predicate, {
    String? description,
    bool skipOffstage = true,
  }) =>
      find.ancestor(
        of: this,
        matching: find.byWidgetPredicate(
          predicate,
          description: description,
          skipOffstage: skipOffstage,
        ),
      );

  Finder findAncestorByTooltip(String message, {bool skipOffstage = true}) =>
      find.ancestor(
        of: this,
        matching: find.byTooltip(message, skipOffstage: skipOffstage),
      );

  Finder findAncestorByElementPredicate(
    ElementPredicate predicate, {
    String? description,
    bool skipOffstage = true,
  }) =>
      find.ancestor(
        of: this,
        matching: find.byElementPredicate(
          predicate,
          description: description,
          skipOffstage: skipOffstage,
        ),
      );

  Finder findAncestorBySemanticsLabel(
    Pattern label, {
    bool skipOffstage = true,
  }) =>
      find.ancestor(
        of: this,
        matching: find.bySemanticsLabel(label, skipOffstage: skipOffstage),
      );
}
