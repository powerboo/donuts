import 'package:donuts/src/test_data/source_gen_test/common/abstract_class.dart';

class ImplementsClass implements AbstractClass {
  final String key;
  ImplementsClass(this.key);

  @override
  AbstractClass commonMethod1() {
    throw UnimplementedError();
  }

  @override
  AbstractClass commonMethod2({required int intValue}) {
    throw UnimplementedError();
  }

  /// child method 1
  ImplementsClass childMethod1() {
    throw UnimplementedError();
  }
}

class ImplementsClassException implements Exception {
  late final String message;
  ImplementsClassException(final String message) {
    this.message = "[ImplementsClassException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
