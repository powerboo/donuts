// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FactoryImplGenerator
// **************************************************************************

import 'package:uuid/uuid.dart';
import 'package:sample_pj/sample_aggregate_root.dart';
import 'package:sample_pj/donuts/factory/sample_aggregate_root.abstract_interface_factory.dart';

class SampleAggregateRootFactoryImpl implements SampleAggregateRootFactory {
  final Uuid uuid = const Uuid();

  @override
  SampleAggregateRoot create({required String value}) {
    final key = uuid.v7();

    return SampleAggregateRoot(
      key: key,
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

class SampleAggregateRootFactoryException implements Exception {
  const SampleAggregateRootFactoryException(String message)
      : message = "[SampleAggregateRootFactoryException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
