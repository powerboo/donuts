// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApplicationServiceProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/factory/domain/fruits/apple/apple.factory_provider.dart';
import 'package:sample_pj/donuts/repository/domain/fruits/apple/apple.repository_provider.dart';
import 'package:sample_pj/donuts/application_service/domain/fruits/apple/apple.application_service_impl.dart';

final appleApplicationServiceProvider =
    Provider<AppleApplicationServiceImpl>((ref) {
  return AppleApplicationServiceImpl(
    appleFactory: ref.watch(appleFactoryProvider),
    appleRepository: ref.watch(appleRepositoryProvider),
  );
});
