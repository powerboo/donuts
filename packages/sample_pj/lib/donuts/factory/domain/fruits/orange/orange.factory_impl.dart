// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FactoryImplGenerator
// **************************************************************************

import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:sample_pj/domain/fruits/orange/orange.dart';
import 'package:sample_pj/donuts/factory/domain/fruits/orange/orange.abstract_interface_factory.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

class OrangeFactoryImpl implements OrangeFactory {
  OrangeFactoryImpl({required KeyFactory this.keyFactory});

  final KeyFactory keyFactory;

  @override
  Orange create({required String name}) {
    final key = keyFactory.create();

    return Orange(
      id: key,
      name: name,
    );
  }

  @override
  Orange restore({
    required FruitsId id,
    required String name,
  }) {
    return Orange(
      id: id,
      name: name,
    );
  }
}

class OrangeFactoryException implements Exception {
  const OrangeFactoryException(String message)
      : message = "[OrangeFactoryException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
