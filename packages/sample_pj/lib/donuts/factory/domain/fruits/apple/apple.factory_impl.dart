// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FactoryImplGenerator
// **************************************************************************

import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:sample_pj/domain/fruits/apple/apple.dart';
import 'package:sample_pj/donuts/factory/domain/fruits/apple/apple.abstract_interface_factory.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

class AppleFactoryImpl implements AppleFactory {
  AppleFactoryImpl({required KeyFactory this.keyFactory});

  final KeyFactory keyFactory;

  @override
  Apple create({required String apple}) {
    final key = keyFactory.create();

    return Apple(
      id: key,
      apple: apple,
    );
  }

  @override
  Apple restore({
    required FruitsId id,
    required String apple,
  }) {
    return Apple(
      id: id,
      apple: apple,
    );
  }
}

class AppleFactoryException implements Exception {
  const AppleFactoryException(String message)
      : message = "[AppleFactoryException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
