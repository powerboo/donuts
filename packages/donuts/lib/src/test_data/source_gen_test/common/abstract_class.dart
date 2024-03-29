import 'package:donuts/src/test_data/source_gen_test/common/key_field_factory.dart';
import 'package:donuts_annotation/donuts_annotation.dart';

@AggregateRoot(
  jsonConverter: AbstractClassJsonConverter(),
  /*
  interfaceChildren: [
    ImplementsClass,
  ],
  // */
)
abstract class AbstractClass {
  String get key;

  AbstractClass(
    @KeyArgument(
      keyFactory: KeyFieldFactory(),
    )
    String key,
  );

  /// method1
  AbstractClass commonMethod1();

  /// method2
  AbstractClass commonMethod2({required int intValue});
}

class AbstractClassJsonConverter
    implements AggregateRootJsonConverter<AbstractClass> {
  const AbstractClassJsonConverter();

  @override
  AbstractClass fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(AbstractClass object) {
    throw UnimplementedError();
  }
}
