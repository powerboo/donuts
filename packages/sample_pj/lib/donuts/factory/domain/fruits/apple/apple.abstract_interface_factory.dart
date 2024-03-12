// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceFactoryGenerator
// **************************************************************************

import 'package:sample_pj/domain/fruits/apple/apple.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

abstract interface class AppleFactory {
  Apple create({required String apple});
  Apple restore({
    required FruitsId id,
    required String apple,
  });
}
