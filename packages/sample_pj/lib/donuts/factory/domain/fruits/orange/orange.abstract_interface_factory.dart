// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceFactoryGenerator
// **************************************************************************

import 'package:sample_pj/domain/fruits/orange/orange.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

abstract interface class OrangeFactory {
  Orange create({required String name});
  Orange restore({
    required FruitsId id,
    required String name,
  });
}
