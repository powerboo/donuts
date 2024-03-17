// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceApiGenerator
// **************************************************************************

import 'package:sample_pj/donuts/repository/domain/donuts_json_serializable_class.abstract_interface_repository.dart';
import 'package:sample_pj/domain/donuts_json_serializable_class.dart';
import 'package:method_to_swagger_yaml_annotation/method_to_swagger_yaml_annotation.dart';

@ConvertTargetClass(
  title: "title",
  version: "0.0.1",
)
abstract interface class DonutsJsonSerializableClassRepositoryApi
    implements DonutsJsonSerializableClassRepository {
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.get,
    pathName: "donuts-json-serializable-class/:key",
  )
  @override
  Future<DonutsJsonSerializableClass?> find({required String key});
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.get,
    pathName: "donuts-json-serializable-class",
  )
  @override
  Future<List<DonutsJsonSerializableClass>> all({
    int cursor = 0,
    int length = 100,
  });
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.post,
    pathName: "donuts-json-serializable-class",
  )
  @override
  Future<void> save(
      {required DonutsJsonSerializableClass donutsJsonSerializableClass});
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.delete,
    pathName: "donuts-json-serializable-class/:key",
  )
  @override
  Future<DonutsJsonSerializableClass?> delete({required String key});
}
