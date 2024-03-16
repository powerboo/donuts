// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FactoryProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/factory/domain/donuts_json_serializable_class.abstract_interface_factory.dart';
import 'package:sample_pj/donuts/factory/domain/donuts_json_serializable_class.factory_impl.dart';
import 'dart:core';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'dart:core';

final donutsJsonSerializableClassFactoryProvider =
    Provider<DonutsJsonSerializableClassFactory>((ref) {
  return DonutsJsonSerializableClassFactoryImpl();
});
