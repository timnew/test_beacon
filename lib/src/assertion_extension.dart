import 'package:flutter_test/flutter_test.dart';

extension AssertionExtension on Finder {
  Finder should(
    Matcher matcher, {
    String? reason,
    dynamic skip, // true or a String
  }) {
    expect(this, matcher, reason: reason, skip: skip);

    return this;
  }

  Finder shouldFindOne({
    String? reason,
    dynamic skip, // true or a String
  }) =>
      should(findsOneWidget, reason: reason, skip: skip);

  Finder shouldFindNothing({
    String? reason,
    dynamic skip, // true or a String
  }) =>
      should(findsNothing, reason: reason, skip: skip);

  Finder shouldFindSome({
    int? count,
    String? reason,
    dynamic skip, // true or a String
  }) =>
      should(
        count == null ? findsWidgets : findsNWidgets(count),
        reason: reason,
        skip: skip,
      );
}
