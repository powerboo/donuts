// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FactoryImplGenerator
// **************************************************************************

import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:sample_pj/domain/sample_aggregate_root.dart';
import 'package:sample_pj/donuts/factory/domain/sample_aggregate_root.abstract_interface_factory.dart';

class SampleAggregateRootFactoryImpl implements SampleAggregateRootFactory {
  SampleAggregateRootFactoryImpl({required KeyFactory this.keyFactory});

  final KeyFactory keyFactory;

  @override
  SampleAggregateRoot create({required String value}) {
    final key = keyFactory.create();

    return SampleAggregateRoot(
      key: key,
      value: value,
    );
  }

  @override
  SampleAggregateRoot restore({
    required ObjectId key,
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
