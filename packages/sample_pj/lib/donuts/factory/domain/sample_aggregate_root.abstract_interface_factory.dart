// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceFactoryGenerator
// **************************************************************************

import 'package:sample_pj/domain/sample_aggregate_root.dart';

abstract interface class SampleAggregateRootFactory {
  SampleAggregateRoot create({required String value});
  SampleAggregateRoot restore({
    required ObjectId key,
    required String value,
  });
}
