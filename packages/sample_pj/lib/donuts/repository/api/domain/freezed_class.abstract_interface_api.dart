// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceApiGenerator
// **************************************************************************

import 'package:sample_pj/donuts/repository/domain/freezed_class.abstract_interface_repository.dart';
import 'package:sample_pj/domain/freezed_class.dart';
import 'package:method_to_swagger_yaml_annotation/method_to_swagger_yaml_annotation.dart';

@ConvertTargetClass(
  title: "title",
  version: "0.0.1",
)
abstract interface class FreezedClassApi implements FreezedClassRepository {
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.get,
    pathName: "freezed-class/:key",
  )
  @override
  Future<FreezedClass?> find({required String key});
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.get,
    pathName: "freezed-class",
  )
  @override
  Future<List<FreezedClass>> all({
    int cursor = 0,
    int length = 100,
  });
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.post,
    pathName: "freezed-class",
  )
  @override
  Future<void> save({required FreezedClass freezedClass});
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.delete,
    pathName: "freezed-class/:key",
  )
  @override
  Future<void> delete({required String key});
}
