// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepositoryProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/repository/donuts_json_serializable_class.abstract_interface_repository.dart';
import 'package:sample_pj/donuts/repository/donuts_json_serializable_class.repository_impl.dart';
import 'package:sample_pj/donuts/repository/donuts_json_serializable_class.in_memory_repository_impl.dart';

final donutsJsonSerializableClassRepositoryProvider =
    Provider<DonutsJsonSerializableClassRepository>((ref) {
  const bool inMemory = true;
  if (inMemory) {
    return InMemoryDonutsJsonSerializableClassRepositoryImpl();
  }
  // ignore: dead_code
  return DonutsJsonSerializableClassRepositoryImpl();
});
