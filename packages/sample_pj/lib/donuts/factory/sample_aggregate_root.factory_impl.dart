// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FactoryImplGenerator
// **************************************************************************

import 'package:sample_pj/sample_aggregate_root.dart';
import 'package:sample_pj/donuts/factory/sample_aggregate_root.abstract_interface_factory.dart';
import 'package:uuid/uuid.dart';

class SampleAggregateRootFactoryImpl implements SampleAggregateRootFactory {
  final Uuid uuid = const Uuid();

  @override
  SampleAggregateRoot create({required String value}) {
    final id = uuid.v7();

    return SampleAggregateRoot(
      key: id,
      value: value,
    );
  }

  @override
  SampleAggregateRoot restore({
    required String key,
    required String value,
  }) {
    return SampleAggregateRoot(
      key: key,
      value: value,
    );
  }
}
