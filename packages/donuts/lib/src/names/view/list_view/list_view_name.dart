import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/names/state/list_state_impl_name.dart';
import 'package:donuts/src/names/view/common/header_name.dart';
import 'package:donuts/src/names/view/create_modal/create_modal_name.dart';
import 'package:donuts/src/names/view/detail_view/detail_view_name.dart';
import 'package:path/path.dart' as p;

class ListViewName {
  final AggregateRootName _aggregateRootName;
  final ListStateImplName _listStateImplName;

  final HeaderName _headerName;
  final DetailViewName _detailViewName;
  final CreateModalName _createModalName;

  ListViewName({
    required AggregateRootName aggregateRootName,
    required ListStateImplName listStateImplName,
    required HeaderName headerName,
    required DetailViewName detailViewName,
    required CreateModalName createModalName,
  })  : _aggregateRootName = aggregateRootName,
        _listStateImplName = listStateImplName,
        _headerName = headerName,
        _detailViewName = detailViewName,
        _createModalName = createModalName;

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
      p0.annotations.add(refer("IndexTarget()"));
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
    final listAsyncValue = ref.watch(${_listStateImplName.myInstanceName});
    
    return Scaffold(
      appBar: const ${_headerName.myClassName}(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ${_createModalName.myFunctionName}(context: context);
        },
        child: const Icon(Icons.add),
      ),
      body: listAsyncValue.when(
        data: (${_aggregateRootName.myInstanceName}List){
          if (${_aggregateRootName.myInstanceName}List.isEmpty){
            return const Center(child:Text("is empty"),);
          }
          
          return ListView.builder(
            itemCount: ${_aggregateRootName.myInstanceName}List.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(${_aggregateRootName.myInstanceName}List[index].${_aggregateRootName.keyInstanceName}.toString()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ${_detailViewName.myClassName}(),
                    ),
                  );
                },
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Column(
            children: [
              const Text("Error"),
              const Divider(),
              Text(error.toString()),
              const SizedBox(height:20),

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
