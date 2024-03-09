// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FactoryImplGenerator
// **************************************************************************

import 'package:uuid/uuid.dart';
import 'package:sample_pj/domain/freezed_class.dart';
import 'package:sample_pj/donuts/factory/domain/freezed_class.abstract_interface_factory.dart';

class FreezedClassFactoryImpl implements FreezedClassFactory {
  final Uuid uuid = const Uuid();

  @override
  FreezedClass create(
    int intValue,
    int? nullableInt, {
    required String freezedClass,
    String? nullableString,
  }) {
    final key = uuid.v7();

    return FreezedClass(
      intValue,
      nullableInt,
      key: key,
      freezedClass: freezedClass,
      nullableString: nullableString,
    );
  }

  @override
  FreezedClass restore(
    int intValue,
    int? nullableInt, {
    required String key,
    required String freezedClass,
    String? nullableString,
  }) {
    return FreezedClass(
      intValue,
      nullableInt,
      key: key,
      freezedClass: freezedClass,
      nullableString: nullableString,
    );
  }
}

class FreezedClassFactoryException implements Exception {
  const FreezedClassFactoryException(String message)
      : message = "[FreezedClassFactoryException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
