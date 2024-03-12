// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FactoryProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/factory/domain/fruits/orange/orange.abstract_interface_factory.dart';
import 'package:sample_pj/donuts/factory/domain/fruits/orange/orange.factory_impl.dart';
import 'package:sample_pj/domain/fruits/common/converter/fruits_id_converter.dart';
import 'package:donuts_annotation/donuts_annotation.dart';

final orangeFactoryProvider = Provider<OrangeFactory>((ref) {
  const KeyFactory? keyFactory = FruitsIdConverter();
  ;
  return OrangeFactoryImpl(keyFactory: keyFactory);
});
