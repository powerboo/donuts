// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceRepositoryGenerator
// **************************************************************************

import 'package:sample_pj/domain/freezed_class.dart';

abstract interface class FreezedClassRepository {
  Future<FreezedClass?> find({required String key});
  Future<List<FreezedClass>> all({
    int cursor = 0,
    int length = 100,
  });
  Future<void> save({required FreezedClass freezedClass});
  Future<void> delete({required String key});
}
