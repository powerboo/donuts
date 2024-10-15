import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:built_collection/built_collection.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts/src/names/common/exception_name.dart';
import 'package:donuts/src/names/repository/abstract_interface_api_name.dart';
import 'package:donuts/src/names/repository/abstract_interface_repository_name.dart';
import 'package:donuts/src/names/repository/api_impl_name.dart';
import 'package:donuts/src/names/repository/in_memory_repository_impl_name.dart';
import 'package:donuts/src/names/repository/repository_impl_name.dart';
import 'package:donuts/src/names/repository/repository_provider_name.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:dart_style/dart_style.dart';

final _formatter = DartFormatter();

class RepositoryProviderGenerator
    extends GeneratorForAnnotation<AggregateRoot> {
  final Map<String, dynamic> config;
  RepositoryProviderGenerator(this.config);
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    return super.generate(library, buildStep);
  }

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    late final bool inMemory;
    if (!config.containsKey("in_memory")) {
      throw InvalidGenerationSourceError(
        "config does not have in_memory.",
        element: element,
      );
    }
    inMemory = config["in_memory"] as bool;

    final aggregateRootName =
        await elementChecker(element, annotation, buildStep);

    final repositoryName = AbstractInterfaceRepositoryName(
      aggregateRootName: aggregateRootName,
    );

    final exception = ExceptionName(
      exceptionBaseName: repositoryName.myClassName,
    );

    final abstractInterfaceApiName = AbstractInterfaceApiName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceRepositoryName: repositoryName,
    );

    final apiImplName = ApiImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceApiName: abstractInterfaceApiName,
      exceptionName: ExceptionName(
        exceptionBaseName: "${aggregateRootName.myClassName}ApiImpl",
      ),
    );

    final repositoryImplName = RepositoryImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceRepositoryName: repositoryName,
      exceptionName: exception,
      abstractInterfaceApiName: abstractInterfaceApiName,
    );

    final inMemoryRepositoryImpl = InMemoryRepositoryImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceRepositoryName: repositoryName,
    );

    final provider = RepositoryProviderName(
      aggregateRootName: aggregateRootName,
      repositoryName: repositoryName,
      repositoryImplName: repositoryImplName,
      inMemoryRepositoryImpl: inMemoryRepositoryImpl,
      inMemory: inMemory,
      apiImplName: apiImplName,
    );

    final lib = Library(((p0) {
      p0.body = ListBuilder<Spec>([
        provider.toFieldElement(),
      ]);

      p0.directives.addAll([
        Directive.import('package:riverpod/riverpod.dart'),
        Directive.import(repositoryName.myPath),
      ]);

      if (!aggregateRootName.customRepository &&
          !aggregateRootName.customInMemoryRepository) {
        p0.directives.addAll([
          Directive.import(repositoryImplName.myPath),
          Directive.import(inMemoryRepositoryImpl.myPath),
          Directive.import(apiImplName.myPath),
        ]);
      }

      if (aggregateRootName.customRepository ||
          aggregateRootName.customInMemoryRepository) {
        p0.directives.addAll([
          Directive.import(aggregateRootName.myPath),
        ]);
      }

      if (aggregateRootName.customRepository) {
        p0.directives.addAll([
          Directive.import(inMemoryRepositoryImpl.myPath),
          Directive.import(repositoryImplName.myPath),
          Directive.import(apiImplName.myPath),
        ]);
      }

      if (aggregateRootName.customInMemoryRepository) {
        p0.directives.addAll([
          Directive.import(inMemoryRepositoryImpl.myPath),
        ]);
      }

      if (aggregateRootName.customRepository ||
          aggregateRootName.customInMemoryRepository) {
        p0.directives.addAll([
          Directive.part("${provider.myPartPath}"),
        ]);
      }
    }));

    return _formatter.format('${lib.accept(DartEmitter())}');
  }
}
