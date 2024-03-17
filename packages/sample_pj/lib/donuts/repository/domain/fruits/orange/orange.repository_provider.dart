// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepositoryProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/repository/domain/fruits/orange/orange.abstract_interface_repository.dart';
import 'package:sample_pj/donuts/repository/domain/fruits/orange/orange.repository_impl.dart';
import 'package:sample_pj/donuts/repository/domain/fruits/orange/orange.in_memory_repository_impl.dart';
import 'package:sample_pj/donuts/repository/api/domain/fruits/orange/orange.api_impl.dart';

final orangeRepositoryProvider = Provider<OrangeRepository>((ref) {
  const bool inMemory = true;
  if (inMemory) {
    return InMemoryOrangeRepositoryImpl();
  }

  // ignore: dead_code
  return OrangeRepositoryImpl(api: OrangeApiImpl());
});
