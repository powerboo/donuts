import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

part 'freezed_class.freezed.dart';
part 'freezed_class.g.dart';

@ShouldGenerate('''
import 'package:__test__/aggregate_root/freezed_class.dart';

abstract interface class FreezedClassFactory {
  FreezedClass create(
    int intValue,
    int? nullableInt, {
    required String freezedClass,
    String? nullableString,
  });
  FreezedClass restore(
    int intValue,
    int? nullableInt, {
    required String key,
    required String freezedClass,
    String? nullableString,
  });
}''')
@AggregateRoot()
@freezed
class FreezedClass with _$FreezedClass {
  const FreezedClass._();
  const factory FreezedClass(
    int intValue,
    int? nullableInt, {
    @KeyArgument() required String key,
    required String freezedClass,
    String? nullableString,
  }) = _FreezedClass;
  factory FreezedClass.fromJson(Map<String, Object?> json) => _$FreezedClassFromJson(json);
}

class FreezedClassException implements Exception {
  late final String message;
  FreezedClassException(final String message) {
    this.message = "[FreezedClassException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
