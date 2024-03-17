// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceApiGenerator
// **************************************************************************

import 'package:sample_pj/donuts/repository/domain/fruits/apple/apple.abstract_interface_repository.dart';
import 'package:sample_pj/domain/fruits/apple/apple.dart';
import 'package:method_to_swagger_yaml_annotation/method_to_swagger_yaml_annotation.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

@ConvertTargetClass(
  title: "title",
  version: "0.0.1",
)
abstract interface class AppleRepositoryApi implements AppleRepository {
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.get,
    pathName: "apple/:id",
  )
  @override
  Future<Apple?> find({required FruitsId id});
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.get,
    pathName: "apple",
  )
  @override
  Future<List<Apple>> all({
    int cursor = 0,
    int length = 100,
  });
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.post,
    pathName: "apple",
  )
  @override
  Future<void> save({required Apple apple});
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.delete,
    pathName: "apple/:id",
  )
  @override
  Future<Apple?> delete({required FruitsId id});
}
