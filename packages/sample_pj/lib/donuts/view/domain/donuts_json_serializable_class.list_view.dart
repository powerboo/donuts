// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ListViewGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:annotation_indexer_annotation/annotation_indexer_annotation.dart';
import 'package:sample_pj/donuts/state/domain/donuts_json_serializable_class.list_state_impl.dart';
import 'package:sample_pj/donuts/view/domain/donuts_json_serializable_class.detail_view.dart';
import 'package:sample_pj/donuts/view/domain/donuts_json_serializable_class.create_modal.dart';

@IndexTarget()
class DonutsJsonSerializableClassListView extends HookConsumerWidget {
  const DonutsJsonSerializableClassListView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final listAsyncValue =
        ref.watch(donutsJsonSerializableClassListStateImplProvider);

    return Scaffold(
      appBar: const DonutsJsonSerializableClassHeader(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await donutsJsonSerializableClassCreateModal(context: context);
        },
        child: const Icon(Icons.add),
      ),
      body: listAsyncValue.when(
        data: (donutsJsonSerializableClassList) {
          if (donutsJsonSerializableClassList.isEmpty) {
            return const Center(
              child: Text("is empty"),
            );
          }

          return ListView.builder(
            itemCount: donutsJsonSerializableClassList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title:
                    Text(donutsJsonSerializableClassList[index].key.toString()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const DonutsJsonSerializableClassDetailView(),
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

class DonutsJsonSerializableClassHeader extends HookConsumerWidget
    implements PreferredSizeWidget {
  const DonutsJsonSerializableClassHeader({Key? key}) : super(key: key);

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
                "[DonutsJsonSerializableClass]ListView",
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
