// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepositoryProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/repository/domain/freezed_class.abstract_interface_repository.dart';
import 'package:sample_pj/donuts/repository/domain/freezed_class.repository_impl.dart';
import 'package:sample_pj/donuts/repository/domain/freezed_class.in_memory_repository_impl.dart';
import 'package:sample_pj/donuts/repository/api/domain/freezed_class.api_impl.dart';

final freezedClassRepositoryProvider = Provider<FreezedClassRepository>((ref) {
  const bool inMemory = true;
  if (inMemory) {
    return InMemoryFreezedClassRepositoryImpl();
  }

  // ignore: dead_code
  return FreezedClassRepositoryImpl(api: FreezedClassApiImpl());
});
