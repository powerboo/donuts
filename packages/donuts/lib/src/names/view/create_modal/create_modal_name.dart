import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:donuts/src/names/state/list_state_impl_name.dart';
import 'package:path/path.dart' as p;

class CreateModalName {
  final AggregateRootName _aggregateRootName;
  final ListStateImplName _listStateImplName;

  CreateModalName({
    required AggregateRootName aggregateRootName,
    required ListStateImplName listStateImplName,
  })  : _aggregateRootName = aggregateRootName,
        _listStateImplName = listStateImplName;

  String get myFunctionName {
    return "${_aggregateRootName.myInstanceName}CreateModal";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/view/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.create_modal.dart",
    );
  }

  Method toClassElement() {
    return Method((p) {
      p.name = myFunctionName;
      p.modifier = MethodModifier.async;
      p.returns = refer("Future<void>");
      p.optionalParameters.add(Parameter((p) {
        p.name = "context";
        p.type = refer("BuildContext");
        p.required = true;
        p.named = true;
      }));

      final argumentList = _listStateImplName.createArgumentList();

      // declare
      final StringBuffer stateDeclareList = StringBuffer();
      final StringBuffer controllerList = StringBuffer();
      controllerList.writeln("// --------------  text field ----------------");
      stateDeclareList.writeln("// --------------  state ----------------");
      for (final arg in argumentList) {
        // state
        stateDeclareList.writeln(
            "final ${arg.name}State = useState<${arg.type.getDisplayString(withNullability: false)}?>(null);");
        // text field
        controllerList.writeln(
            "final ${arg.name}Controller = useTextEditingController();");
      }

      // widget
      final StringBuffer textFieldList = StringBuffer();
      for (final arg in argumentList) {
        textFieldList.writeln('''
Row(
  children: [
    const Text("${arg.name}"),
    const SizedBox(width: 20),
    Expanded(
      child: TextField(
        controller: ${arg.name}Controller,
        onChanged: (value) {
          final val = value as ${arg.type};
          ${arg.name}State.value = val;
        },
      ),
    ),
  ],
),
''');
      }

      final StringBuffer stateList = StringBuffer();
      for (final param in _aggregateRootName.constructorElement.parameters) {
        if (param.metadata
            .any((e) => e.element?.displayName == "KeyArgument")) {
          continue;
        }
        stateList
            .writeln('''final ${param.name} = ${param.name}State.value;''');
      }
      final StringBuffer unwrapNull = StringBuffer();
      for (final param in _aggregateRootName.constructorElement.parameters) {
        if (param.metadata
            .any((e) => e.element?.displayName == "KeyArgument")) {
          continue;
        }
        unwrapNull.writeln("if(${param.name}== null){return;}");
      }

      p.body = Code('''
await showModalBottomSheet(
    context: context,
    builder: (_) {
      return HookConsumer(
        builder: (context, ref, child) {
          ${controllerList.toString()}
          ${stateDeclareList.toString()}

          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  ${textFieldList.toString()}
                  ElevatedButton(
                    onPressed: () async {
                      ${stateList.toString()}
                      ${unwrapNull.toString()}
                      ref.read(${_listStateImplName.myInstanceName}.notifier).create(
                        ${_aggregateRootName.initArgumentString(ignoreKey: true)}
                      ).then((value){
                        Navigator.pop(context);
                      },);
                    },
                    child: const Text("Create"),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
''');
    });
  }
}
