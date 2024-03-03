import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/names/common/exception_name.dart';
import 'package:donuts/src/names/repository/abstract_interface_repository_name.dart';
import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:path/path.dart' as p;
import 'package:donuts/src/generator/common/element_checker.dart';

class RepositoryImplName {
  final AggregateRootName _aggregateRootName;
  final AbstractInterfaceRepositoryName _abstractInterfaceRepositoryName;
  final ExceptionName _exceptionName;

  RepositoryImplName({
    required AggregateRootName aggregateRootName,
    required AbstractInterfaceRepositoryName abstractInterfaceRepositoryName,
    required ExceptionName exceptionName,
  })  : _aggregateRootName = aggregateRootName,
        _abstractInterfaceRepositoryName = abstractInterfaceRepositoryName,
        _exceptionName = exceptionName {
    // fromJson
  }

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

      late final String toJsonString;
      late final String fromJsonString;
      if (_aggregateRootName.jsonConverter == null) {
        toJsonString = "${_aggregateRootName.myInstanceName}.toJson()";
        fromJsonString = "${_aggregateRootName.myClassName}.fromJson";
      } else {
        p0.fields.add(Field((f) {
          f.name = "converter";
          f.type = refer(_aggregateRootName.jsonConverter!.myClassName);
          f.assignment = Code('''
          ${_aggregateRootName.jsonConverter!.myClassName}()
''');
        }));
        toJsonString = "converter.toJson(${_aggregateRootName.myInstanceName})";
        fromJsonString = "${_aggregateRootName.jsonConverter!.fromJson()}";
      }

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
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/${_aggregateRootName.myClassName.toKebabCase()}/\${${_aggregateRootName.keyInstanceName}}",
      ),
      headers: {},
    );
    
    if(response.statusCode != 200){
      throw ${_exceptionName.myClassName}("network error");
    }
    
    final body = jsonDecode(response.body);
    if(body is! Map<String, dynamic>){
      throw ${_exceptionName.myClassName}("body is not Map<String, dynamic>");
    }

    return ${fromJsonString}(body);
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
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/${_aggregateRootName.myClassName.toKebabCase()}?cursor=\${cursor}&length=\${length}",
      ),
      headers: {},
    );
    
    if(response.statusCode != 200){
      throw ${_exceptionName.myClassName}("network error");
    }

    final data = jsonDecode(response.body);
    if (data is! List<Map<String, dynamic>>) {
      throw ${_exceptionName.myClassName}("data is not List<Map<String, dynamic>>");
    }

    final List<${_aggregateRootName.myClassName}> result = [];
    for(final r in data){
      result.add(${fromJsonString}(r));
    }
    return result;
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
    final response = await http.post(
      Uri.https(
        'https://www.google.com',
        "/v1/${_aggregateRootName.myClassName.toKebabCase()}",
      ),
      body: jsonEncode(${toJsonString}),
      headers: {},
    );
    
    if (response.statusCode != 200) {
      throw ${_exceptionName.myClassName}("network error");
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
    final response = await http.delete(
      Uri.https(
        'https://www.google.com',
        "/v1/${_aggregateRootName.myClassName.toKebabCase()}/\${${_aggregateRootName.keyInstanceName}}",
      ),
      headers: {},
    );

    if(response.statusCode != 200){
      throw ${_exceptionName.myClassName}("network error");
    }
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
