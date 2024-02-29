import 'package:donuts_annotation/donuts_annotation.dart';

@AggregateRoot()
interface class InterfaceClass {
  InterfaceClass({
    @KeyArgument() required String key,
  });
}
