// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceApplicationServiceGenerator
// **************************************************************************

import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:sample_pj/domain/donuts_json_serializable_class.dart';

abstract interface class DonutsJsonSerializableClassApplicationService {
  Future<(DonutsJsonSerializableClass?, DonutsError?)> create(
    String? nullableString, {
    bool? isOk,
  });
  Future<(DonutsJsonSerializableClass?, DonutsError?)> find(
      {required String key});
  Future<(void, DonutsError?)> save(
      {required DonutsJsonSerializableClass donutsJsonSerializableClass});
  Future<(void, DonutsError?)> delete({required String key});
  Future<(List<DonutsJsonSerializableClass>?, DonutsError?)> all({
    int cursor = 0,
    int length = 100,
  });
}
