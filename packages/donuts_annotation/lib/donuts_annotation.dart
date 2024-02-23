library donuts_annotation;

class AggregateRoot {
  const AggregateRoot();
}

class KeyArgument<KeyType> {
  final KeyArgumentDiv keyArgumentDiv;
  final KeyFactory<KeyType>? keyFactory;

  const KeyArgument({
    this.keyArgumentDiv = KeyArgumentDiv.uuidV7,
    this.keyFactory = null,
  });
}

enum KeyArgumentDiv {
  uuidV7("uuidV7"),
  object("object"),
  ;

  final String toStringValue;
  const KeyArgumentDiv(this.toStringValue);
  factory KeyArgumentDiv.from({
    required String value,
  }) {
    final indexEnum = KeyArgumentDiv.values.firstWhere((e) => e.toStringValue == value);
    return indexEnum;
  }
}

abstract interface class KeyFactory<KeyType> {
  KeyType create();
}
