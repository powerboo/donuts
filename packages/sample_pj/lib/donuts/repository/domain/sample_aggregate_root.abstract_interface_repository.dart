// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceRepositoryGenerator
// **************************************************************************

import 'package:sample_pj/domain/sample_aggregate_root.dart';

abstract interface class SampleAggregateRootRepository {
  Future<SampleAggregateRoot?> find({required ObjectId key});
  Future<List<SampleAggregateRoot>> all({
    int cursor = 0,
    int length = 100,
  });
  Future<void> save({required SampleAggregateRoot sampleAggregateRoot});
  Future<void> delete({required ObjectId key});
}
