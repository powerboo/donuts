// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceFactoryGenerator
// **************************************************************************

import 'package:sample_pj/freezed_class.dart';

abstract interface class FreezedClassFactory {
  FreezedClass create(
    int intValue,
    int? nullableInt, {
    required String freezedClass,
    String? nullableString,
  });
  FreezedClass restore(
    int intValue,
    int? nullableInt, {
    required String key,
    required String freezedClass,
    String? nullableString,
  });
}
