import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/generator/common/names/repository/abstract_interface_repository_name.dart';
import 'package:donuts/src/generator/common/names/common/aggregate_root_name.dart';
import 'package:path/path.dart' as p;
import 'package:donuts/src/generator/common/element_checker.dart';

class InMemoryRepositoryImplName {
  final AggregateRootName _aggregateRootName;
  final AbstractInterfaceRepositoryName _abstractInterfaceRepositoryName;

  InMemoryRepositoryImplName({
    required AggregateRootName aggregateRootName,
    required AbstractInterfaceRepositoryName abstractInterfaceRepositoryName,
  })  : _aggregateRootName = aggregateRootName,
        _abstractInterfaceRepositoryName = abstractInterfaceRepositoryName;

  String get myClassName {
    return "InMemory${_aggregateRootName.element.displayName}RepositoryImpl";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/repository/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.in_memory_repository_impl.dart",
    );
  }

  Class toClassElement() {
    return Class((p0) {
      p0.name = myClassName;
      p0.abstract = false;
      p0.implements = ListBuilder<Reference>([
        refer(
          _abstractInterfaceRepositoryName.myClassName,
          _abstractInterfaceRepositoryName.myPath,
        ),
      ]);
      p0.fields = ListBuilder([
        Field((p1) {
          p1.name = "store";
          // p1.modifier = FieldModifier.final$;
          p1.type = refer("List<${_aggregateRootName.myClassName}>");
          p1.assignment = Code("[]");
        }),
      ]);
      final find = Method((p0) {
        p0.modifier = MethodModifier.async;
        p0.returns = refer('Future<${_aggregateRootName.myClassName}?>');
        p0.name = 'find';
        p0.annotations.add(
          refer('override'),
        );

        p0.optionalParameters.add(Parameter((p1) {
          p1.name = _aggregateRootName.keyInstanceName;
          p1.type = refer(_aggregateRootName.keyClassName);
          p1.named = true;
          p1.required = true;
        }));
        p0.body = Code('''
    return store.where((s)=>s.${_aggregateRootName.keyInstanceName} == ${_aggregateRootName.keyInstanceName}).firstOrNull;
''');
      });

      final all = Method((p0) {
        p0.modifier = MethodModifier.async;
        p0.returns = refer('Future<List<${_aggregateRootName.myClassName}>>');
        p0.name = 'all';
        p0.annotations.add(
          refer('override'),
        );

        p0.optionalParameters.add(Parameter((p1) {
          p1.name = 'cursor';
          p1.type = refer('int');
          p1.defaultTo = Code('0');
          p1.named = true;
          p1.required = false;
        }));
        p0.optionalParameters.add(Parameter((p1) {
          p1.name = 'length';
          p1.type = refer('int');
          p1.defaultTo = Code('100');
          p1.named = true;
          p1.required = false;
        }));
        p0.body = Code('''
    return store.skip(cursor).take(length).toList();
''');
      });

      final save = Method((p0) {
        p0.modifier = MethodModifier.async;
        p0.returns = refer('Future<void>');
        p0.name = 'save';
        p0.annotations.add(
          refer('override'),
        );

        p0.optionalParameters.add(Parameter((p1) {
          p1.name = _aggregateRootName.myInstanceName;
          p1.type = refer(_aggregateRootName.myClassName);
          p1.named = true;
          p1.required = true;
        }));
        p0.body = Code('''
    if(await find(${_aggregateRootName.keyInstanceName}: ${_aggregateRootName.myInstanceName}.${_aggregateRootName.keyInstanceName}) == null){
      store = [...store, ${_aggregateRootName.myInstanceName}];
    } else {
      final deleted = store.where((s) => s.${_aggregateRootName.keyInstanceName} != ${_aggregateRootName.myInstanceName}.${_aggregateRootName.keyInstanceName}).toList();
      store = [...deleted, ${_aggregateRootName.myInstanceName}];
    }
''');
      });

      final delete = Method((p0) {
        p0.modifier = MethodModifier.async;
        p0.returns = refer('Future<void>');
        p0.name = 'delete';
        p0.annotations.add(
          refer('override'),
        );

        p0.optionalParameters.add(Parameter((p1) {
          p1.name = _aggregateRootName.keyInstanceName;
          p1.type = refer(_aggregateRootName.keyClassName);
          p1.named = true;
          p1.required = true;
        }));
        p0.body = Code('''
    store = store.where((s) => s.${_aggregateRootName.keyInstanceName} != ${_aggregateRootName.keyInstanceName}).toList();
''');
      });

      p0.methods = ListBuilder([
        find,
        all,
        save,
        delete,
      ]);
    });
  }
}
