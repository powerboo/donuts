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
      p.body = Code('''
await showModalBottomSheet(
    context: context,
    builder: (_) {
      return HookConsumer(
        builder: (context, ref, child) {
          return Container();
        },
      );
    },
  );
''');
    });
  }
}
