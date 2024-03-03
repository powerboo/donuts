// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceApplicationServiceGenerator
// **************************************************************************

import 'package:donuts_annotation/donuts_error.dart';
import 'package:sample_pj/abstract_class.dart';

abstract interface class AbstractClassApplicationService {
  Future<(AbstractClass?, DonutsError?)> create();
  Future<(AbstractClass?, DonutsError?)> find({required String key});
  Future<(void, DonutsError?)> save({required AbstractClass abstractClass});
  Future<(void, DonutsError?)> delete({required String key});
  Future<(List<AbstractClass>?, DonutsError?)> all({
    int cursor = 0,
    int length = 100,
  });

  /// method1
  Future<(AbstractClass?, DonutsError?)> commonMethod1({required String key});

  /// method2
  Future<(AbstractClass?, DonutsError?)> commonMethod2({
    required String key,
    required int intValue,
  });
}
