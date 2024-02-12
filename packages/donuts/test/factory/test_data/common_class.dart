import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:__test__/common_class.dart';

abstract interface class CommonClassFactory {
  CommonClass create({required String name});
  CommonClass restore({
    required CommonClassId commonClassId,
    required String name,
  });
}
''')
@AggregateRoot()
class CommonClass {
  final CommonClassId commonClassId;
  final String name;
  const CommonClass({
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
