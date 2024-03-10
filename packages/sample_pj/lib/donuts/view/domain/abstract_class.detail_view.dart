// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// DetailViewGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_pj/domain/abstract_class.dart';
import 'package:sample_pj/donuts/state/domain/abstract_class.single_state_impl.dart';

class AbstractClassDetailView extends HookConsumerWidget {
  const AbstractClassDetailView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final AsyncValue<AbstractClass?> value =
        ref.watch(abstractClassSingleStateImplProvider);
    return Scaffold(
      appBar: const AbstractClassHeader(),
      body: value.when(
        data: (data) {
          if (data == null) {
            return Column(
              children: [
                const Text("Error"),
                const Divider(),
                const SizedBox(height: 20),
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
                Row(
                  children: [
                    const Text("String key :"),
                    Text(data.key.toString()),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          commonMethod1ExecShowModal(context: context),
                      child: const Text("commonMethod1"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          commonMethod2ExecShowModal(context: context),
                      child: const Text("commonMethod2"),
                    ),
                  ],
                ),
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
    );
  }
}

Future<void> commonMethod1ExecShowModal({required BuildContext context}) async {
  /* 
ref.read(abstractClassSingleStateImplProvider.notifier)
.commonMethod1("",
b:1,
val:null,
)
*/

  await showModalBottomSheet(
    context: context,
    builder: (context) => const Text("commonMethod1"),
  );
}

Future<void> commonMethod2ExecShowModal({required BuildContext context}) async {
  /* 
ref.read(abstractClassSingleStateImplProvider.notifier)
.commonMethod2("",
b:1,
val:null,
)
*/

  await showModalBottomSheet(
    context: context,
    builder: (context) => const Text("commonMethod2"),
  );
}

class AbstractClassHeader extends HookConsumerWidget
    implements PreferredSizeWidget {
  const AbstractClassHeader({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
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
                "[AbstractClass]DetailView",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
