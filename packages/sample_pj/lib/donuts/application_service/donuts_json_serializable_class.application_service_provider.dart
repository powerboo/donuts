// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApplicationServiceProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/factory/donuts_json_serializable_class.factory_provider.dart';
import 'package:sample_pj/donuts/repository/donuts_json_serializable_class.repository_provider.dart';
import 'package:sample_pj/donuts/application_service/donuts_json_serializable_class.application_service_impl.dart';

final donutsJsonSerializableClassApplicationServiceProvider =
    Provider<DonutsJsonSerializableClassApplicationServiceImpl>((ref) {
  return DonutsJsonSerializableClassApplicationServiceImpl(
    donutsJsonSerializableClassFactory:
        ref.watch(donutsJsonSerializableClassFactoryProvider),
    donutsJsonSerializableClassRepository:
        ref.watch(donutsJsonSerializableClassRepositoryProvider),
  );
});
