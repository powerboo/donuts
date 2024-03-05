import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/names/state/list_state_impl_name.dart';
import 'package:donuts/src/names/view/header_name.dart';
import 'package:path/path.dart' as p;

class ListViewName {
  final AggregateRootName _aggregateRootName;
  final ListStateImplName _listStateImplName;
  final HeaderName _headerName;

  ListViewName({
    required AggregateRootName aggregateRootName,
    required ListStateImplName listStateImplName,
    required HeaderName headerName,
  })  : _aggregateRootName = aggregateRootName,
        _listStateImplName = listStateImplName,
        _headerName = headerName;

  String get myClassName {
    return "${_aggregateRootName.element.displayName}ListView";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/view/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.list_view.dart",
    );
  }

  Class toClassElement() {
    return Class((p0) {
      p0.name = myClassName;
      p0.extend = refer("HookConsumerWidget");
      p0.constructors.add(Constructor((p1) {
        p1.constant = true;
        p1.optionalParameters.add(Parameter((p2) {
          p2.name = "key";
          p2.type = refer("Key?");
          p2.named = true;
        }));
        p1.initializers.add(Code("super(key: key)"));
      }));

      p0.methods.add(Method((p3) {
        p3.annotations.add(refer("override"));
        p3.name = "build";
        p3.returns = refer("Widget");
        p3.body = Block((p4) {
          p4.statements.add(Code('''
    return Scaffold(
      appBar: const ${_headerName.myClassName}(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('ボタン'),
        ),
      ),
    );'''));
        });
        p3.requiredParameters.addAll([
          Parameter((p5) {
            p5.type = refer("BuildContext");
            p5.name = "context";
          }),
          Parameter((p5) {
            p5.type = refer("WidgetRef");
            p5.name = "ref";
          }),
        ]);
      }));
    });
  }
}

class ListStateNameException implements Exception {
  late final String message;
  ListStateNameException(final String message) {
    this.message = "[ListStateNameException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
