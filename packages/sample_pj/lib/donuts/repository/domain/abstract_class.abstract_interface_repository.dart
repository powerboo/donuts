// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceRepositoryGenerator
// **************************************************************************

import 'package:sample_pj/domain/abstract_class.dart';

abstract interface class AbstractClassRepository {
  Future<AbstractClass?> find({required String key});
  Future<List<AbstractClass>> all({
    int cursor = 0,
    int length = 100,
  });
  Future<void> save({required AbstractClass abstractClass});
  Future<void> delete({required String key});
}
