// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApplicationServiceProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/factory/abstract_class.factory_provider.dart';
import 'package:sample_pj/donuts/repository/abstract_class.repository_provider.dart';
import 'package:sample_pj/donuts/application_service/abstract_class.application_service_impl.dart';

final abstractClassApplicationServiceProvider =
    Provider<AbstractClassApplicationServiceImpl>((ref) {
  return AbstractClassApplicationServiceImpl(
    abstractClassFactory: ref.watch(abstractClassFactoryProvider),
    abstractClassRepository: ref.watch(abstractClassRepositoryProvider),
  );
});
