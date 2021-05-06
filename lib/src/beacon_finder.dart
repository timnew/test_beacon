import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'beacon.dart';

typedef bool BeaconPredicate(Beacon beacon);

class BeaconFinder<T> extends MatchFinder {
  final dynamic value;
  final BeaconPredicate? predicate;

  BeaconFinder({
    this.value,
    this.predicate,
    bool skipOffstage = true,
  }) : super(skipOffstage: skipOffstage);

  @override
  String get description {
    final description = StringBuffer();

    if (T is Beacon) {
      description.write("$T");
    } else if (T == dynamic) {
      description.write("any beacon");
    } else {
      description.write("Beacon<$T>");
    }

    if (value != null) {
      description.write(" with value $value");
    }

    if (predicate != null) {
      description.write(" satifies predicate");
    }

    return description.toString();
  }

  @override
  bool matches(Element candidate) {
    final widget = candidate.widget;

    if (widget is! Beacon<T>) return false;
    if (value != null && widget.value != value) return false;
    if (predicate != null && !predicate!(widget)) return false;

    return true;
  }
}
