// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceApiGenerator
// **************************************************************************

import 'package:sample_pj/donuts/repository/domain/abstract_class.abstract_interface_repository.dart';
import 'package:sample_pj/domain/abstract_class.dart';
import 'package:method_to_swagger_yaml_annotation/method_to_swagger_yaml_annotation.dart';

@ConvertTargetClass(
  title: "title",
  version: "0.0.1",
)
abstract interface class AbstractClassApi implements AbstractClassRepository {
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.get,
    pathName: "abstract-class/:key",
  )
  @override
  Future<AbstractClass?> find({required String key});
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.get,
    pathName: "abstract-class",
  )
  @override
  Future<List<AbstractClass>> all({
    int cursor = 0,
    int length = 100,
  });
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.post,
    pathName: "abstract-class",
  )
  @override
  Future<void> save({required AbstractClass abstractClass});
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.delete,
    pathName: "abstract-class/:key",
  )
  @override
  Future<void> delete({required String key});
}
