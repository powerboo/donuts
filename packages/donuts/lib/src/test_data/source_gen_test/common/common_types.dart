import 'package:donuts_annotation/donuts_annotation.dart';

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

class CommonClassId {
  final String value;
  CommonClassId(this.value);
}
