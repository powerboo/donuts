part of 'abstract_class.factory_provider.dart';

class AbstractClassFactoryImplCustom implements AbstractClassFactoryImpl {
  @override
  AbstractClass restore(String key) {
    throw UnimplementedError();
  }

  @override
  AbstractClass create() {
    throw UnimplementedError();
  }
}
