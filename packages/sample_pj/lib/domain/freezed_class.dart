import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_class.freezed.dart';
part 'freezed_class.g.dart';

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
  factory FreezedClass.fromJson(Map<String, Object?> json) =>
      _$FreezedClassFromJson(json);
}
