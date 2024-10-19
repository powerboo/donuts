import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:donuts/src/names/repository/abstract_interface_repository_name.dart';
import 'package:path/path.dart' as p;

class AbstractInterfaceApiName {
  final AggregateRootName _aggregateRootName;
  final AbstractInterfaceRepositoryName _abstractInterfaceRepositoryName;
  AbstractInterfaceApiName({
    required AggregateRootName aggregateRootName,
    required AbstractInterfaceRepositoryName abstractInterfaceRepositoryName,
  })  : _aggregateRootName = aggregateRootName,
        _abstractInterfaceRepositoryName = abstractInterfaceRepositoryName;
  String get myClassName {
    return "${_aggregateRootName.element.displayName}Api";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/repository/api/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.abstract_interface_api.dart",
    );
  }

  Class toClassElement() {
    return Class(
      (p0) {
        p0.name = myClassName;
        p0.abstract = true;
        p0.modifier = ClassModifier.interface;
        p0.annotations.add(CodeExpression(
          Code('''
ConvertTargetClass(
  title: "${_aggregateRootName.element.documentationComment ?? "title"}",
  version: "0.0.1",
)
'''),
        ));
        p0.implements
            .add(refer("${_abstractInterfaceRepositoryName.myClassName}"));

        // final findAll = Method((m) {});
        // final deleteAll = Method((m) {});
        final find = Method((m) {
          m.name = "find";
          m.annotations.addAll([
            CodeExpression(
              Code('''
ConvertTargetMethod(
    httpMethod: HttpMethodDiv.get,
    pathName: "${_aggregateRootName.myClassName.toKebabCase()}/:${_aggregateRootName.keyInstanceName}",
)
'''),
            ),
            refer('override'),
          ]);
          m.returns = refer("Future<${_aggregateRootName.myClassName}?>");
          m.optionalParameters.add(Parameter((p) {
            p.name = _aggregateRootName.keyInstanceName;
            p.type = refer(_aggregateRootName.keyClassName);
            p.required = true;
            p.named = true;
            p.annotations.add(CodeExpression(Code('''
RequestParameter(
  requestParameterDiv: RequestParameterDiv.path,
  useToString: true,
)
''')));
          }));
        });

        final all = Method((m) {
          m.name = "all";
          m.annotations.addAll([
            CodeExpression(
              Code('''
ConvertTargetMethod(
    httpMethod: HttpMethodDiv.get,
    pathName: "${_aggregateRootName.myClassName.toKebabCase()}",
)
'''),
            ),
            refer('override'),
          ]);
          m.returns = refer("Future<List<${_aggregateRootName.myClassName}>>");
          m.optionalParameters.addAll([
            Parameter((p) {
              p.name = "cursor";
              p.type = refer("int");
              p.defaultTo = Code("0");
              p.required = false;
              p.named = true;
            }),
            Parameter((p) {
              p.name = "length";
              p.type = refer("int");
              p.defaultTo = Code("100");
              p.required = false;
              p.named = true;
            })
          ]);
        });

        final save = Method((m) {
          m.name = "save";
          m.annotations.addAll([
            CodeExpression(
              Code('''
ConvertTargetMethod(
    httpMethod: HttpMethodDiv.post,
    pathName: "${_aggregateRootName.myClassName.toKebabCase()}",
)
'''),
            ),
            refer('override'),
          ]);
          m.returns = refer("Future<void>");
          m.optionalParameters.add(Parameter((p) {
            p.name = _aggregateRootName.myInstanceName;
            p.type = refer(_aggregateRootName.myClassName);
            p.required = true;
            p.named = true;
          }));
        });
        final delete = Method((m) {
          m.name = "delete";
          m.annotations.addAll([
            CodeExpression(
              Code('''
ConvertTargetMethod(
    httpMethod: HttpMethodDiv.delete,
    pathName: "${_aggregateRootName.myClassName.toKebabCase()}/:${_aggregateRootName.keyInstanceName}",
)
'''),
            ),
            refer('override'),
          ]);
          m.returns = refer("Future<void>");
          m.optionalParameters.add(Parameter((p) {
            p.name = _aggregateRootName.keyInstanceName;
            p.type = refer(_aggregateRootName.keyClassName);
            p.required = true;
            p.named = true;
            p.annotations.add(CodeExpression(Code('''
RequestParameter(
  requestParameterDiv: RequestParameterDiv.path,
  useToString: true,
)
''')));
          }));
        });

        p0.methods.addAll([
          find,
          all,
          save,
          delete,
        ]);
      },
    );
  }
}
