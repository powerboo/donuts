import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:__test__/abstract_interface_class.dart';

abstract interface class AbstractInterfaceClassFactory {
  AbstractInterfaceClass create();
  AbstractInterfaceClass restore(String key);
}''')
@AggregateRoot()
abstract interface class AbstractInterfaceClass {
  AbstractInterfaceClass(
    @KeyArgument() String key,
  );
}
