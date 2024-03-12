// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepositoryProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/repository/domain/fruits/apple/apple.abstract_interface_repository.dart';
import 'package:sample_pj/donuts/repository/domain/fruits/apple/apple.repository_impl.dart';
import 'package:sample_pj/donuts/repository/domain/fruits/apple/apple.in_memory_repository_impl.dart';

final appleRepositoryProvider = Provider<AppleRepository>((ref) {
  const bool inMemory = true;
  if (inMemory) {
    return InMemoryAppleRepositoryImpl();
  }

  // ignore: dead_code
  return AppleRepositoryImpl();
});
