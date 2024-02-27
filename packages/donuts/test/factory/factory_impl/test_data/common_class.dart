import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:__test__/common_class.dart';
import 'package:__test__/donuts/factory/common_class_factory.dart';
import 'package:uuid/uuid.dart';

class CommonClassFactoryImpl implements CommonClassFactory {
  final Uuid uuid = Uuid();

  CommonClass create(
    String value,
    String? nullableValue, {
    required String name,
  }) {
    final id = uuid.v7();

    return CommonClass(value, nullableValue, {
      key: id,
      name: name,
    });
  }

  CommonClass restore(
    String value,
    String? nullableValue, {
    required String key,
    required String name,
  }) {
    return CommonClass(value, nullableValue, {
      key: key,
      name: name,
    });
  }
}''')
@AggregateRoot()
class CommonClass {
  final String name;
  const CommonClass(
    String value,
    String? nullableValue, {
    @KeyArgument() required String key,
    required this.name,
  });
}
