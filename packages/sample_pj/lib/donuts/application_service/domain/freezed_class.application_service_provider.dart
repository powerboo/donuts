// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApplicationServiceProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/factory/domain/freezed_class.factory_provider.dart';
import 'package:sample_pj/donuts/repository/domain/freezed_class.repository_provider.dart';
import 'package:sample_pj/donuts/application_service/domain/freezed_class.application_service_impl.dart';

final freezedClassApplicationServiceProvider =
    Provider<FreezedClassApplicationServiceImpl>((ref) {
  return FreezedClassApplicationServiceImpl(
    freezedClassFactory: ref.watch(freezedClassFactoryProvider),
    freezedClassRepository: ref.watch(freezedClassRepositoryProvider),
  );
});
