import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:code_builder/code_builder.dart';

class HeaderName {
  final AggregateRootName _aggregateRootName;
  final String _title;

  HeaderName({
    required AggregateRootName aggregateRootName,
    required String title,
  })  : _aggregateRootName = aggregateRootName,
        _title = title;

  String get myClassName {
    return "${_aggregateRootName.element.displayName}Header";
  }

  Class toClassElement() {
    return Class((p0) {
      p0.name = myClassName;
      p0.extend = refer("HookConsumerWidget");
      p0.implements.add(refer("PreferredSizeWidget"));

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
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Colors.orange,
      shadowColor: Colors.transparent,
      title: const Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "${_title}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
'''));
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
      p0.methods.add(Method((p3) {
        p3.annotations.add(refer("override"));
        p3.name = "preferredSize";
        p3.returns = refer("Size");
        p3.type = MethodType.getter;
        p3.lambda = true;
        p3.body = Code("const Size.fromHeight(kToolbarHeight)");
      }));
    });
  }
}
