import 'package:donuts_annotation/donuts_annotation.dart';

@AggregateRoot()
abstract interface class AbstractInterfaceClass {
  AbstractInterfaceClass(
    @KeyArgument() String key,
  );
}
