import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension FindChildExtension on Finder {
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
