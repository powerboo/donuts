part of 'abstract_class.factory_provider.dart';

class AbstractClassFactoryImplCustom implements AbstractClassFactory {
  @override
  AbstractClass create() {
    throw UnimplementedError();
  }

  @override
  AbstractClass restore(String key) {
    throw UnimplementedError();
  }
}
