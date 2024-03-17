// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepositoryProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/repository/domain/abstract_class.abstract_interface_repository.dart';
import 'package:sample_pj/donuts/repository/domain/abstract_class.repository_impl.dart';
import 'package:sample_pj/donuts/repository/domain/abstract_class.in_memory_repository_impl.dart';
import 'package:sample_pj/donuts/repository/api/domain/abstract_class.api_impl.dart';

final abstractClassRepositoryProvider =
    Provider<AbstractClassRepository>((ref) {
  const bool inMemory = true;
  if (inMemory) {
    return InMemoryAbstractClassRepositoryImpl();
  }

  // ignore: dead_code
  return AbstractClassRepositoryImpl(api: AbstractClassApiImpl());
});
