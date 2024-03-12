// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApplicationServiceProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/factory/domain/fruits/orange/orange.factory_provider.dart';
import 'package:sample_pj/donuts/repository/domain/fruits/orange/orange.repository_provider.dart';
import 'package:sample_pj/donuts/application_service/domain/fruits/orange/orange.application_service_impl.dart';

final orangeApplicationServiceProvider =
    Provider<OrangeApplicationServiceImpl>((ref) {
  return OrangeApplicationServiceImpl(
    orangeFactory: ref.watch(orangeFactoryProvider),
    orangeRepository: ref.watch(orangeRepositoryProvider),
  );
});
