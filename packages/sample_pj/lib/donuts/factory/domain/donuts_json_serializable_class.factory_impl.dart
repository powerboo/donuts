// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FactoryImplGenerator
// **************************************************************************

import 'package:uuid/uuid.dart';
import 'package:sample_pj/domain/donuts_json_serializable_class.dart';
import 'package:sample_pj/donuts/factory/domain/donuts_json_serializable_class.abstract_interface_factory.dart';

class DonutsJsonSerializableClassFactoryImpl
    implements DonutsJsonSerializableClassFactory {
  final Uuid uuid = const Uuid();

  @override
  DonutsJsonSerializableClass create(
    String? nullableString, {
    bool? isOk,
  }) {
    final key = uuid.v7();

    return DonutsJsonSerializableClass(
      nullableString,
      key: key,
      isOk: isOk,
    );
  }

  @override
  DonutsJsonSerializableClass restore(
    String? nullableString, {
    required String key,
    bool? isOk,
  }) {
    return DonutsJsonSerializableClass(
      nullableString,
      key: key,
      isOk: isOk,
    );
  }
}

class DonutsJsonSerializableClassFactoryException implements Exception {
  const DonutsJsonSerializableClassFactoryException(String message)
      : message = "[DonutsJsonSerializableClassFactoryException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
