// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FactoryImplGenerator
// **************************************************************************

import 'package:sample_pj/abstract_class.dart';
import 'package:sample_pj/donuts/factory/abstract_class.abstract_interface_factory.dart';

class AbstractClassFactoryImpl implements AbstractClassFactory {
  @override
  AbstractClass create() {
    throw AbstractClassFactoryException(
        "[AbstractClass] is interface or abstract.must be implement custom factory.Please check Section XXX in https://pub.dev/packages/donuts");
  }

  @override
  AbstractClass restore(String key) {
    throw AbstractClassFactoryException(
        "[AbstractClass] is interface or abstract.must be implement custom factory.Please check Section XXX in https://pub.dev/packages/donuts");
  }
}

class AbstractClassFactoryException implements Exception {
  const AbstractClassFactoryException(String message)
      : message = "[AbstractClassFactoryException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
