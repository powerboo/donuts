import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/names/state/single_state_impl_name.dart';
import 'package:donuts/src/names/view/common/header_name.dart';
import 'package:path/path.dart' as p;

class DetailViewName {
  final AggregateRootName _aggregateRootName;
  final SingleStateImplName _singleStateImplName;
  final HeaderName _headerName;

  DetailViewName({
    required AggregateRootName aggregateRootName,
    required SingleStateImplName singleStateImplName,
    required HeaderName headerName,
  })  : _aggregateRootName = aggregateRootName,
        _singleStateImplName = singleStateImplName,
        _headerName = headerName;

  String get myClassName {
    return "${_aggregateRootName.element.displayName}DetailView";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/view/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.detail_view.dart",
    );
  }

  List<Method> toModalElement() {
    final List<Method> methodList = [];
    for (final method in _aggregateRootName.element.methods) {
      methodList.add(Method((p0) {
        p0.name = "${method.name}ExecShowModal";
        p0.returns = refer("Future<void>");
        p0.optionalParameters.add(Parameter((p) {
          p.name = "context";
          p.type = refer("BuildContext");
          p.required = true;
          p.named = true;
        }));
        p0.body = Code('''
/* 
ref.read(${_singleStateImplName.myInstanceName}.notifier)
.${method.name}(${_aggregateRootName.methodArgumentString(method.name)})
*/

await showModalBottomSheet(
  context: context,
  builder: (context) => const Text("${method.name}"),
);
''');
        p0.modifier = MethodModifier.async;
      }));
    }

    return methodList;
  }

  Class toClassElement() {
    final StringBuffer fieldWidgetList = StringBuffer();
    for (final field in _aggregateRootName.element.fields) {
      fieldWidgetList.writeln('''
Row(
  children: [
    Text("${field.type.getDisplayString(withNullability: true)} ${field.name} :"),
    Text(data.${field.name}.toString()),
  ],
),
''');
    }

    final StringBuffer accessorWidgetList = StringBuffer();
    for (final mixin in _aggregateRootName.element.mixins) {
      for (final accessor in mixin.accessors) {
        if (accessor.name == "copyWith") {
          continue;
        }
        accessorWidgetList.writeln('''
Row(
  children: [
    Text("${accessor.type.returnType.getDisplayString(withNullability: true)} ${accessor.name} "),
    Text(data.${accessor.name}.toString()),
  ],
),
''');
      }
    }

    final StringBuffer methodButtonList = StringBuffer();
    for (final method in _aggregateRootName.element.methods) {
      methodButtonList.writeln('''
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton(
      onPressed: () => ${method.name}ExecShowModal(context:context),
      child: const Text("${method.name}"),
    ),
  ],
),
''');
    }

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
    final AsyncValue<${_aggregateRootName.myClassName}?> value = ref.watch(${_singleStateImplName.myInstanceName});
    return Scaffold(
      appBar: const ${_headerName.myClassName}(),
      body: value.when(
        data: (data) {
          if (data == null) {
            return Column(
              children: [
                const Text("Error"),
                const Divider(),
                const SizedBox(height:20),
                const Text("value is null"),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("back"),
                ),
              ],
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                ${fieldWidgetList.toString()}
                ${accessorWidgetList.toString()}
                const Divider(),
                ${methodButtonList.toString()}
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Column(
            children: [
              const Text("Error"),
              const Divider(),
              Text(error.toString()),
              const SizedBox(height: 20),
              const Text("StackTrace"),
              const Divider(),
              Text(stackTrace.toString()),
            ],
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
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
