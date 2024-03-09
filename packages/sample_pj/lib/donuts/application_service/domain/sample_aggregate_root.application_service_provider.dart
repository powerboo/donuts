// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApplicationServiceProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/factory/domain/sample_aggregate_root.factory_provider.dart';
import 'package:sample_pj/donuts/repository/domain/sample_aggregate_root.repository_provider.dart';
import 'package:sample_pj/donuts/application_service/domain/sample_aggregate_root.application_service_impl.dart';

final sampleAggregateRootApplicationServiceProvider =
    Provider<SampleAggregateRootApplicationServiceImpl>((ref) {
  return SampleAggregateRootApplicationServiceImpl(
    sampleAggregateRootFactory: ref.watch(sampleAggregateRootFactoryProvider),
    sampleAggregateRootRepository:
        ref.watch(sampleAggregateRootRepositoryProvider),
  );
});
