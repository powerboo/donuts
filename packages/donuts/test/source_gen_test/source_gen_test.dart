import 'dart:async';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:build_test/build_test.dart';
import 'package:donuts/src/generator/factory/abstract_interface_factory_generator.dart';
import 'package:source_gen_test/source_gen_test.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as p;

Future<void> main() async {
  test("abstract_class", () async {
    final name = "abstract_class";
    await testFactory(name);
    await testFactoryImpl(name);
    await testFactoryProvider(name);
    await testRepository(name);
    await testInMemoryRepositoryImpl(name);
    await testRepositoryImpl(name);
    await testRepositoryProvider(name);
    /*
    await testApplicationService('abstract_class');
    await testState('abstract_class');
    // */
  });

  test("abstract_interface_class", () async {
    final name = "abstract_interface_class";
    await testFactory(name);
    await testFactoryImpl(name);
    await testFactoryProvider(name);
    await testRepository(name);
    await testInMemoryRepositoryImpl(name);
    await testRepositoryImpl(name);
    await testRepositoryProvider(name);
    /*
    await testApplicationService('abstract_interface_class');
    await testState('abstract_interface_class');
    // */
  });

  test("common_types", () async {
    final name = "common_types";
    await testFactory(name);
    await testFactoryImpl(name);
    await testFactoryProvider(name);
    await testRepository(name);
    await testInMemoryRepositoryImpl(name);
    await testRepositoryImpl(name);
    await testRepositoryProvider(name);
    /*
    await testApplicationService('common_types');
    await testState('common_types');
    // */
  });

  test("freezed_class", () async {
    final name = "freezed_class";
    await testFactory(name);
    await testFactoryImpl(name);
    await testFactoryProvider(name);
    await testRepository(name);
    await testInMemoryRepositoryImpl(name);
    await testRepositoryImpl(name);
    await testRepositoryProvider(name);
    /*
    await testApplicationService('freezed_class');
    await testState('freezed_class');
    // */
  });

  test("interface_class", () async {
    final name = "interface_class";
    await testFactory(name);
    await testFactoryImpl(name);
    await testFactoryProvider(name);
    await testRepository(name);
    await testInMemoryRepositoryImpl(name);
    await testRepositoryImpl(name);
    await testRepositoryProvider(name);
    /*
    await testApplicationService('interface_class');
    await testState('interface_class');
    // */
  });

  test("json_serializable_class", () async {
    final name = "json_serializable_class";
    await testFactory(name);
    await testFactoryImpl(name);
    await testFactoryProvider(name);
    await testRepository(name);
    await testInMemoryRepositoryImpl(name);
    await testRepositoryImpl(name);
    await testRepositoryProvider(name);
    /*
    await testApplicationService('json_serializable_class');
    await testState('json_serializable_class');
    // */
  });

  test("multiple_aggregate_root", () async {
    /*
    final name = "multiple_aggregate_root";
    await testFactory(name, error: true);
    await testFactoryImpl(name, error: true);
    await testFactoryProvider(name, error: true);
    await testRepository(name, error: true);
    await testInMemoryRepositoryImpl(name, error: true);
    await testRepositoryImpl(name, error: true);
    await testRepositoryProvider(name, error: true);
    await testApplicationService('multiple_aggregate_root');
    await testState('multiple_aggregate_root');
    // */
  });

  initializeBuildLogTracking();

  tearDown(() {
    clearBuildLog();
  });

  final path = p.join('test', 'source_gen_test', 'build_error');

  // does not have default constructor
  final doesNotHaveDefaultConstructor =
      await initializeLibraryReaderForDirectory(
    path,
    'does_not_have_default_constructor.dart',
  );

  testAnnotatedElements(
    doesNotHaveDefaultConstructor,
    AbstractInterfaceFactoryGenerator(),
  );

  // annotated field does not exists
  final annotatedFieldDoesNotExists = await initializeLibraryReaderForDirectory(
    path,
    'annotated_argument_does_not_exists.dart',
  );

  testAnnotatedElements(
    annotatedFieldDoesNotExists,
    AbstractInterfaceFactoryGenerator(),
  );

  // duplicate key argument
  final duplicateKeyArgument = await initializeLibraryReaderForDirectory(
    path,
    'duplicate_key_argument.dart',
  );

  testAnnotatedElements(
    duplicateKeyArgument,
    AbstractInterfaceFactoryGenerator(),
  );

  // does not have fromJson. But does not have jsonConverter

  // does not have toJson. But does not have jsonConverter
}

Future<void> testFactory(String fileName, {bool error = false}) async {
  final main = await resolveSources(
    {
      'donuts|lib/donuts/factory/src/test_data/source_gen_test/${error ? "error" : "common"}/${fileName}.abstract_interface_factory.dart':
          useAssetReader,
    },
    (r) => r.libraries.firstWhere(
        (element) => element.source.toString().contains('${fileName}')),
  );

  final paths = [
    '/donuts/lib/donuts/factory/src/test_data/source_gen_test/${error ? "error" : "common"}/${fileName}.abstract_interface_factory.dart',
  ];

  for (final path in paths) {
    final result = await main.session.getErrors(path) as ErrorsResult;
    if (!error) {
      expect(result.errors, isEmpty);
    } else {
      expect(result.errors, isNotEmpty);
    }
  }
}

Future<void> testFactoryImpl(String fileName, {bool error = false}) async {
  final main = await resolveSources(
    {
      'donuts|lib/donuts/factory/src/test_data/source_gen_test/${error ? "error" : "common"}/${fileName}.factory_impl.dart':
          useAssetReader,
    },
    (r) => r.libraries.firstWhere(
        (element) => element.source.toString().contains('${fileName}')),
  );

  final paths = [
    '/donuts/lib/donuts/factory/src/test_data/source_gen_test/${error ? "error" : "common"}/${fileName}.factory_impl.dart',
  ];

  for (final path in paths) {
    final result = await main.session.getErrors(path) as ErrorsResult;
    if (!error) {
      expect(result.errors, isEmpty);
    } else {
      expect(result.errors, isNotEmpty);
    }
  }
}

Future<void> testFactoryProvider(String fileName, {bool error = false}) async {
  final main = await resolveSources(
    {
      'donuts|lib/donuts/factory/src/test_data/source_gen_test/${error ? "error" : "common"}/${fileName}.factory_provider.dart':
          useAssetReader,
    },
    (r) => r.libraries.firstWhere(
        (element) => element.source.toString().contains('${fileName}')),
  );

  final paths = [
    '/donuts/lib/donuts/factory/src/test_data/source_gen_test/${error ? "error" : "common"}/${fileName}.factory_provider.dart',
  ];

  for (final path in paths) {
    final result = await main.session.getErrors(path) as ErrorsResult;
    if (!error) {
      expect(result.errors, isEmpty);
    } else {
      expect(result.errors, isNotEmpty);
    }
  }
}

Future<void> testRepository(String fileName, {bool error = false}) async {
  final main = await resolveSources(
    {
      'donuts|lib/donuts/repository/src/test_data/source_gen_test/${error ? "error" : "common"}/${fileName}.abstract_interface_repository.dart':
          useAssetReader,
    },
    (r) => r.libraries.firstWhere(
        (element) => element.source.toString().contains('${fileName}')),
  );

  final paths = [
    '/donuts/lib/donuts/repository/src/test_data/source_gen_test/${error ? "error" : "common"}/${fileName}.abstract_interface_repository.dart',
  ];

  for (final path in paths) {
    final result = await main.session.getErrors(path) as ErrorsResult;
    if (!error) {
      expect(result.errors, isEmpty);
    } else {
      expect(result.errors, isNotEmpty);
    }
  }
}

Future<void> testInMemoryRepositoryImpl(String fileName,
    {bool error = false}) async {
  final main = await resolveSources(
    {
      'donuts|lib/donuts/repository/src/test_data/source_gen_test/${error ? "error" : "common"}/${fileName}.in_memory_repository_impl.dart':
          useAssetReader,
    },
    (r) => r.libraries.firstWhere(
        (element) => element.source.toString().contains('${fileName}')),
  );

  final paths = [
    '/donuts/lib/donuts/repository/src/test_data/source_gen_test/${error ? "error" : "common"}/${fileName}.in_memory_repository_impl.dart',
  ];

  for (final path in paths) {
    final result = await main.session.getErrors(path) as ErrorsResult;
    if (!error) {
      expect(result.errors, isEmpty);
    } else {
      expect(result.errors, isNotEmpty);
    }
  }
}

Future<void> testRepositoryImpl(String fileName, {bool error = false}) async {
  final main = await resolveSources(
    {
      'donuts|lib/donuts/repository/src/test_data/source_gen_test/${error ? "error" : "common"}/${fileName}.repository_impl.dart':
          useAssetReader,
    },
    (r) => r.libraries.firstWhere(
        (element) => element.source.toString().contains('${fileName}')),
  );

  final paths = [
    '/donuts/lib/donuts/repository/src/test_data/source_gen_test/${error ? "error" : "common"}/${fileName}.repository_impl.dart',
  ];

  for (final path in paths) {
    final result = await main.session.getErrors(path) as ErrorsResult;
    if (!error) {
      expect(result.errors, isEmpty);
    } else {
      expect(result.errors, isNotEmpty);
    }
  }
}

Future<void> testRepositoryProvider(String fileName,
    {bool error = false}) async {
  final main = await resolveSources(
    {
      'donuts|lib/donuts/repository/src/test_data/source_gen_test/${error ? "error" : "common"}/${fileName}.repository_provider.dart':
          useAssetReader,
    },
    (r) => r.libraries.firstWhere(
        (element) => element.source.toString().contains('${fileName}')),
  );

  final paths = [
    '/donuts/lib/donuts/repository/src/test_data/source_gen_test/${error ? "error" : "common"}/${fileName}.repository_provider.dart',
  ];

  for (final path in paths) {
    final result = await main.session.getErrors(path) as ErrorsResult;
    if (!error) {
      expect(result.errors, isEmpty);
    } else {
      expect(result.errors, isNotEmpty);
    }
  }
}

Future<void> testApplicationService(String fileName) async {
  final main = await resolveSources(
    {
      'donuts|lib/donuts/application_service/src/test_data/source_gen_test/common/${fileName}.application_service_impl.dart':
          useAssetReader,
      'donuts|lib/donuts/application_service/src/test_data/source_gen_test/common/${fileName}.application_service_provider.dart':
          useAssetReader,
    },
    (r) => r.libraries.firstWhere(
        (element) => element.source.toString().contains('${fileName}')),
  );

  final paths = [
    '/donuts/lib/donuts/application_service/src/test_data/source_gen_test/common/${fileName}.application_service_impl.dart',
    '/donuts/lib/donuts/application_service/src/test_data/source_gen_test/common/${fileName}.application_service_provider.dart',
  ];

  for (final path in paths) {
    final result = await main.session.getErrors(path) as ErrorsResult;
    expect(result.errors, isEmpty);
  }
}

Future<void> testState(String fileName) async {
  final main = await resolveSources(
    {
      'donuts|lib/donuts/state/src/test_data/source_gen_test/common/${fileName}.list_state_impl.dart':
          useAssetReader,
      'donuts|lib/donuts/state/src/test_data/source_gen_test/common/${fileName}.single_state_impl.dart':
          useAssetReader,
    },
    (r) => r.libraries.firstWhere(
        (element) => element.source.toString().contains('${fileName}')),
  );

  final paths = [
    '/donuts/lib/donuts/state/src/test_data/source_gen_test/common/${fileName}.list_state_impl.dart',
    '/donuts/lib/donuts/state/src/test_data/common/${fileName}.single_state_impl.dart',
  ];

  for (final path in paths) {
    final result = await main.session.getErrors(path) as ErrorsResult;
    expect(result.errors, isEmpty);
  }
}
