// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ListViewGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:annotation_indexer_annotation/annotation_indexer_annotation.dart';
import 'package:sample_pj/donuts/state/domain/abstract_class.list_state_impl.dart';
import 'package:sample_pj/donuts/view/domain/abstract_class.detail_view.dart';
import 'package:sample_pj/donuts/view/domain/abstract_class.create_modal.dart';

@IndexTarget()
class AbstractClassListView extends HookConsumerWidget {
  const AbstractClassListView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final listAsyncValue = ref.watch(abstractClassListStateImplProvider);

    return Scaffold(
      appBar: const AbstractClassHeader(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await abstractClassCreateModal(context: context);
        },
        child: const Icon(Icons.add),
      ),
      body: listAsyncValue.when(
        data: (abstractClassList) {
          if (abstractClassList.isEmpty) {
            return const Center(
              child: Text("is empty"),
            );
          }

          return ListView.builder(
            itemCount: abstractClassList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(abstractClassList[index].key.toString()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AbstractClassDetailView(),
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
                "[AbstractClass]ListView",
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
