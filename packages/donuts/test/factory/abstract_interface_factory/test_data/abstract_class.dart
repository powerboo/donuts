import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:__test__/abstract_class.dart';

abstract interface class AbstractClassFactory {
  AbstractClass create();
  AbstractClass restore(String key);
}''')
@AggregateRoot()
class AbstractClass {
  AbstractClass(
    @KeyArgument() String key,
  );
}
