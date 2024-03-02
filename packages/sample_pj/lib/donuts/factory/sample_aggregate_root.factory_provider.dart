// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FactoryProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/factory/sample_aggregate_root.abstract_interface_factory.dart';
import 'package:sample_pj/donuts/factory/sample_aggregate_root.factory_impl.dart';
import 'package:sample_pj/sample_aggregate_root.dart';

final sampleAggregateRootFactoryProvider =
    Provider<SampleAggregateRootFactory>((ref) {
  return SampleAggregateRootFactoryImpl();
});
