import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:__test__/aggregate_root/common_class.dart';

abstract interface class CommonClassFactory {
  CommonClass create(
    String value,
    String? nullableValue, {
    required String name,
  });
  CommonClass restore(
    String value,
    String? nullableValue, {
    required CommonClassId commonClassId,
    required String name,
  });
}
''')
@AggregateRoot()
class CommonClass {
  final CommonClassId commonClassId;
  final String name;
  const CommonClass(
    String value,
    String? nullableValue, {
    @KeyArgument() required this.commonClassId,
    required this.name,
  });
}

class CommonClassException implements Exception {
  late final String message;
  CommonClassException(final String message) {
    this.message = "[CommonClassException] $message";
  }
  @override
  String toString() {
    return message;
  }
}

class CommonClassId {
  final String value;
  CommonClassId(this.value);
}
