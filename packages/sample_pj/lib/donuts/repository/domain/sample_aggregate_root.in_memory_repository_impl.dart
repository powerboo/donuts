// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InMemoryRepositoryImplGenerator
// **************************************************************************

import 'package:sample_pj/domain/sample_aggregate_root.dart';
import 'package:sample_pj/donuts/repository/domain/sample_aggregate_root.abstract_interface_repository.dart';

class InMemorySampleAggregateRootRepositoryImpl
    implements SampleAggregateRootRepository {
  List<SampleAggregateRoot> store = [];

  @override
  Future<SampleAggregateRoot?> find({required ObjectId key}) async {
    return store.where((s) => s.key == key).firstOrNull;
  }

  @override
  Future<List<SampleAggregateRoot>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    return store.skip(cursor).take(length).toList();
  }

  @override
  Future<void> save({required SampleAggregateRoot sampleAggregateRoot}) async {
    if (await find(key: sampleAggregateRoot.key) == null) {
      store = [...store, sampleAggregateRoot];
    } else {
      final deleted =
          store.where((s) => s.key != sampleAggregateRoot.key).toList();
      store = [...deleted, sampleAggregateRoot];
    }
  }

  @override
  Future<void> delete({required ObjectId key}) async {
    store = store.where((s) => s.key != key).toList();
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
