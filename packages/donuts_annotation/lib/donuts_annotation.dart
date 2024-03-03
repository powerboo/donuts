library donuts_annotation;

class AggregateRoot {
  // factory
  final bool customFactory;

  // repository
  final bool customRepository;
  final bool customInMemoryRepository;
  // final bool useInMemory;

  // application service
  final bool customApplicationService;

  // list state
  final bool customListState;

  // single state
  final bool customSingleState;

  // interface group
  // final List<Type> interfaceChildren;

  final AggregateRootJsonConverter? jsonConverter;

  const AggregateRoot({
    // factory
    this.customFactory = false,

    // repository
    this.customRepository = false,
    this.customInMemoryRepository = false,
    // this.useInMemory = false,

    // application service
    this.customApplicationService = false,

    // list state
    this.customListState = false,

    // single state
    this.customSingleState = false,

    // interface group
    // this.interfaceChildren = const [],
    this.jsonConverter = null,
  });
}

class KeyArgument<KeyType> {
  final KeyFactory<KeyType>? keyFactory;

  const KeyArgument({
    this.keyFactory = null,
  });
}

abstract interface class KeyFactory<KeyType> {
  KeyType create();
}

abstract interface class AggregateRootJsonConverter<AggregateRootType> {
  AggregateRootType fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(AggregateRootType aggregateRoot);
}

class IgnoreMethod {
  const IgnoreMethod();
}
