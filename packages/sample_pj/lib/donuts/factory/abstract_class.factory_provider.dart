// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FactoryProviderGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts/factory/abstract_class.abstract_interface_factory.dart';
import 'package:sample_pj/abstract_class.dart';
part 'package:sample_pj/donuts/factory/abstract_class.factory_provider.custom.dart';

/// [AbstractClass] is interface or abstract
/// must be implement custom factory.
/// Please check Section XXX in https://pub.dev/packages/donuts
/// create file : abstract_class.factory_provider.custom.dart
/// Please copy and paste the following text into the file
/*
part of 'abstract_class.factory_provider.dart';
class AbstractClassFactoryImplCustom
    implements AbstractClassFactory {
  @override
  AbstractClass create() {
    throw UnimplementedError();
  }

  @override
  AbstractClass restore(String key) {
    throw UnimplementedError();
  }
}
*/
final abstractClassFactoryProvider = Provider<AbstractClassFactory>((ref) {
  return AbstractClassFactoryImplCustom();
});
