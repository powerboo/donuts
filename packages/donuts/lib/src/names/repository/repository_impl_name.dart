import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/names/common/exception_name.dart';
import 'package:donuts/src/names/repository/abstract_interface_api_name.dart';
import 'package:donuts/src/names/repository/abstract_interface_repository_name.dart';
import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:path/path.dart' as p;

class RepositoryImplName {
  final AggregateRootName _aggregateRootName;
  final AbstractInterfaceRepositoryName _abstractInterfaceRepositoryName;
  final AbstractInterfaceApiName _abstractInterfaceApiName;

  RepositoryImplName({
    required AggregateRootName aggregateRootName,
    required AbstractInterfaceRepositoryName abstractInterfaceRepositoryName,
    required ExceptionName exceptionName,
    required AbstractInterfaceApiName abstractInterfaceApiName,
  })  : _aggregateRootName = aggregateRootName,
        _abstractInterfaceRepositoryName = abstractInterfaceRepositoryName,
        _abstractInterfaceApiName = abstractInterfaceApiName;

  String get myClassName {
    return "${_aggregateRootName.element.displayName}RepositoryImpl";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/repository/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.repository_impl.dart",
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

      p0.constructors.add(Constructor((c) {
        c.optionalParameters.add(Parameter((p) {
          p.name = "api";
          p.named = true;
          p.required = true;
          p.toThis = true;
        }));
      }));

      p0.fields.add(Field((f) {
        f.name = "api";
        f.type = refer(_abstractInterfaceApiName.myClassName);
        f.modifier = FieldModifier.final$;
      }));

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
return api.find(${_aggregateRootName.keyInstanceName}: ${_aggregateRootName.keyInstanceName});
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
return api.all(cursor: cursor, length: length,);
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
api.save(${_aggregateRootName.myInstanceName}:${_aggregateRootName.myInstanceName});
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
api.delete(${_aggregateRootName.keyInstanceName}:${_aggregateRootName.keyInstanceName});
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
