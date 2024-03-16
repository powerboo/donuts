// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FactoryProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/factory/domain/fruits/apple/apple.abstract_interface_factory.dart';
import 'package:sample_pj/donuts/factory/domain/fruits/apple/apple.factory_impl.dart';
import 'package:sample_pj/domain/fruits/common/converter/fruits_id_converter.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';
import 'package:sample_pj/domain/fruits/common/converter/fruits_id_converter.dart';
import 'package:donuts_annotation/donuts_annotation.dart';

final appleFactoryProvider = Provider<AppleFactory>((ref) {
  const KeyFactory? keyFactory = FruitsIdConverter();
  ;
  return AppleFactoryImpl(keyFactory: keyFactory);
});
