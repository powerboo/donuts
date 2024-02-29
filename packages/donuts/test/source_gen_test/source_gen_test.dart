import 'dart:async';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:build_test/build_test.dart';
import 'package:donuts/src/generator/factory/abstract_interface_factory_generator.dart';
import 'package:source_gen_test/source_gen_test.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as p;

Future<void> main() async {
  // final library = await Library.parseFromStacktrace();

  test("abstract_class", () async {
    await testGeneratedFile('abstract_class');
  });

  test("abstract_interface_class", () async {
    await testGeneratedFile('abstract_interface_class');
  });

  test("common_types", () async {
    await testGeneratedFile('common_types');
  });

  test("freezed_class", () async {
    await testGeneratedFile('freezed_class');
  });

  test("interface_class", () async {
    await testGeneratedFile('interface_class');
  });

  test("json_serializable_class", () async {
    await testGeneratedFile('json_serializable_class');
  });

  test("error", () async {
    await testGeneratedFile('multiple_aggregate_root');
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
}

Future<void> testGeneratedFile(String fileName) async {
  final main = await resolveSources(
    {
      'donuts|lib/donuts/factory/source_gen_test/common/${fileName}.abstract_interface_factory.dart':
          useAssetReader,
      'donuts|lib/donuts/factory/source_gen_test/common/${fileName}.factory_impl.dart':
          useAssetReader,
      'donuts|lib/donuts/factory/source_gen_test/common/${fileName}.factory_provider.dart':
          useAssetReader,
      'donuts|lib/donuts/factory/source_gen_test/common/${fileName}.abstract_interface_repository.dart':
          useAssetReader,
      'donuts|lib/donuts/factory/source_gen_test/common/${fileName}.repository_impl.dart':
          useAssetReader,
      'donuts|lib/donuts/factory/source_gen_test/common/${fileName}.repository_provider.dart':
          useAssetReader,
      'donuts|lib/donuts/factory/source_gen_test/common/${fileName}.application_service_impl.dart':
          useAssetReader,
      'donuts|lib/donuts/factory/source_gen_test/common/${fileName}.application_service_provider.dart':
          useAssetReader,
      'donuts|lib/donuts/factory/source_gen_test/common/${fileName}.list_state_impl.dart':
          useAssetReader,
      'donuts|lib/donuts/factory/source_gen_test/common/${fileName}.single_state_impl.dart':
          useAssetReader,
    },
    (r) => r.libraries.firstWhere(
        (element) => element.source.toString().contains('${fileName}')),
  );

  final paths = [
    '/donuts/lib/donuts/factory/source_gen_test/common/${fileName}.abstract_interface_factory.dart',
    '/donuts/lib/donuts/factory/source_gen_test/common/${fileName}.factory_impl.dart',
    '/donuts/lib/donuts/factory/source_gen_test/common/${fileName}.factory_provider.dart',
    '/donuts/lib/donuts/repository/source_gen_test/common/${fileName}.abstract_interface_repository.dart',
    '/donuts/lib/donuts/repository/source_gen_test/common/${fileName}.repository_impl.dart',
    '/donuts/lib/donuts/repository/source_gen_test/common/${fileName}.repository_provider.dart',
    '/donuts/lib/donuts/application_service/source_gen_test/common/${fileName}.application_service_impl.dart',
    '/donuts/lib/donuts/application_service/source_gen_test/common/${fileName}.application_service_provider.dart',
    '/donuts/lib/donuts/state/source_gen_test/common/${fileName}.list_state_impl.dart',
    '/donuts/lib/donuts/state/common/${fileName}.single_state_impl.dart',
  ];

  for (final path in paths) {
    final result = await main.session.getErrors(path) as ErrorsResult;
    expect(result.errors, isEmpty);
  }
}
