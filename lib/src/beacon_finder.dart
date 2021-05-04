import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'beacon.dart';

typedef bool BeaconTagCriteria<T>(T? tag);

class BeaconFinder<B extends Beacon<T>, T> extends MatchFinder {
  final BeaconTagCriteria<T>? criteria;
  final String? _description;

  BeaconFinder({
    this.criteria,
    String? description,
    bool skipOffstage = true,
  })  : _description = description,
        super(skipOffstage: skipOffstage);

  @override
  String get description => _description ?? "$B";

  @override
  bool matches(Element candidate) =>
      candidate.widget is B &&
      (criteria?.call((candidate.widget as Beacon<T>).tag) ?? true);
}
