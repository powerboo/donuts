import 'package:donuts/src/test_data/source_gen_test/common/key_field_factory.dart';
import 'package:donuts_annotation/donuts_annotation.dart';

@AggregateRoot(
  jsonConverter: AbstractInterfaceClassJsonConverter(),
)
abstract interface class AbstractInterfaceClass {
  String get key;
  AbstractInterfaceClass(
    @KeyArgument(
      keyFactory: KeyFieldFactory(),
    )
    String key,
  );
}

class AbstractInterfaceClassJsonConverter
    implements AggregateRootJsonConverter<AbstractInterfaceClass> {
  const AbstractInterfaceClassJsonConverter();

  @override
  AbstractInterfaceClass fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(AbstractInterfaceClass object) {
    throw UnimplementedError();
  }
}
