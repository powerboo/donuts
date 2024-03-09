// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepositoryProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/repository/domain/sample_aggregate_root.abstract_interface_repository.dart';
import 'package:sample_pj/donuts/repository/domain/sample_aggregate_root.repository_impl.dart';
import 'package:sample_pj/donuts/repository/domain/sample_aggregate_root.in_memory_repository_impl.dart';

final sampleAggregateRootRepositoryProvider =
    Provider<SampleAggregateRootRepository>((ref) {
  const bool inMemory = true;
  if (inMemory) {
    return InMemorySampleAggregateRootRepositoryImpl();
  }

  // ignore: dead_code
  return SampleAggregateRootRepositoryImpl();
});
