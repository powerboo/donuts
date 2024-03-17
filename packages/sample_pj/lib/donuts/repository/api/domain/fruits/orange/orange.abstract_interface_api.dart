// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceApiGenerator
// **************************************************************************

import 'package:sample_pj/donuts/repository/domain/fruits/orange/orange.abstract_interface_repository.dart';
import 'package:sample_pj/domain/fruits/orange/orange.dart';
import 'package:method_to_swagger_yaml_annotation/method_to_swagger_yaml_annotation.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

@ConvertTargetClass(
  title: "title",
  version: "0.0.1",
)
abstract interface class OrangeRepositoryApi implements OrangeRepository {
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.get,
    pathName: "orange/:id",
  )
  @override
  Future<Orange?> find({required FruitsId id});
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.get,
    pathName: "orange",
  )
  @override
  Future<List<Orange>> all({
    int cursor = 0,
    int length = 100,
  });
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.post,
    pathName: "orange",
  )
  @override
  Future<void> save({required Orange orange});
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.delete,
    pathName: "orange/:id",
  )
  @override
  Future<Orange?> delete({required FruitsId id});
}
