import 'package:donuts/src/test_data/source_gen_test/common/common_types.dart';
import 'package:donuts_annotation/donuts_annotation.dart';

class KeyFieldFactory implements KeyFactory<CommonClassId> {
  const KeyFieldFactory();

  @override
  CommonClassId create() {
    throw KeyFieldFactoryException("un implements.");
  }
}

class KeyFieldFactoryException implements Exception {
  late final String message;
  KeyFieldFactoryException(final String message) {
    this.message = "[KeyFieldFactoryException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
