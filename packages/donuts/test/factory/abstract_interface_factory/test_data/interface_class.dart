import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:__test__/interface_class.dart';

abstract interface class InterfaceClassFactory {
  InterfaceClass create();
  InterfaceClass restore({required String key});
}''')
@AggregateRoot()
interface class InterfaceClass {
  InterfaceClass({
    @KeyArgument() required String key,
  });
}
