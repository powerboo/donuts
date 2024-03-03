library donuts_annotation;

class AggregateRoot {
  // factory
  final bool extensionFactory;

  // repository
  final bool extensionRepository;
  final bool extensionInMemoryRepository;
  final bool useInMemory;

  // application service
  final bool extensionApplicationService;

  // list state
  final bool extensionListState;

  // single state
  final bool extensionSingleState;

  // interface group
  final List<Type> interfaceChildren;

  final AggregateRootJsonConverter? jsonConverter;

  const AggregateRoot({
    // factory
    this.extensionFactory = false,

    // repository
    this.extensionRepository = false,
    this.extensionInMemoryRepository = false,
    this.useInMemory = false,

    // application service
    this.extensionApplicationService = false,

    // list state
    this.extensionListState = false,

    // single state
    this.extensionSingleState = false,

    // interface group
    this.interfaceChildren = const [],
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
