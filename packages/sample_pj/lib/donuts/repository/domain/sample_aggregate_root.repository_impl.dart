// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepositoryImplGenerator
// **************************************************************************

import 'package:sample_pj/donuts/repository/domain/sample_aggregate_root.abstract_interface_repository.dart';
import 'package:sample_pj/domain/sample_aggregate_root.dart';
import 'package:sample_pj/donuts/repository/api/domain/sample_aggregate_root.abstract_interface_api.dart';

class SampleAggregateRootRepositoryImpl
    implements SampleAggregateRootRepository {
  SampleAggregateRootRepositoryImpl({required this.api});

  final SampleAggregateRootApi api;

  @override
  Future<SampleAggregateRoot?> find({required ObjectId key}) async {
    return api.find(key: key);
  }

  @override
  Future<List<SampleAggregateRoot>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    return api.all(
      cursor: cursor,
      length: length,
    );
  }

  @override
  Future<void> save({required SampleAggregateRoot sampleAggregateRoot}) async {
    api.save(sampleAggregateRoot: sampleAggregateRoot);
  }

  @override
  Future<void> delete({required ObjectId key}) async {
    api.delete(key: key);
  }
}

class SampleAggregateRootRepositoryException implements Exception {
  const SampleAggregateRootRepositoryException(String message)
      : message = "[SampleAggregateRootRepositoryException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
