// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceRepositoryGenerator
// **************************************************************************

import 'package:sample_pj/donuts_json_serializable_class.dart';

abstract interface class DonutsJsonSerializableClassRepository {
  Future<DonutsJsonSerializableClass?> find({required String key});
  Future<List<DonutsJsonSerializableClass>> all({
    int cursor = 0,
    int length = 100,
  });
  Future<void> save(
      {required DonutsJsonSerializableClass donutsJsonSerializableClass});
  Future<void> delete({required String key});
}
