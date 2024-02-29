import 'package:donuts_annotation/donuts_annotation.dart';

@AggregateRoot()
class AbstractClass {
  AbstractClass(
    @KeyArgument() String key,
  );
}
