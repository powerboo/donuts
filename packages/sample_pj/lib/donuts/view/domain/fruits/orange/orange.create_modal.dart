// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// CreateModalGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sample_pj/donuts/state/domain/fruits/orange/orange.list_state_impl.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

Future<void> orangeCreateModal({required BuildContext context}) async {
  await showModalBottomSheet(
    context: context,
    builder: (_) {
      return HookConsumer(
        builder: (context, ref, child) {
          // --------------  text field ----------------
          final nameController = useTextEditingController();

          // --------------  state ----------------
          final nameState = useState<String?>(null);

          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("name"),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: nameController,
                          onChanged: (value) {
                            final val = value as String;
                            nameState.value = val;
                          },
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final name = nameState.value;

                      if (name == null) {
                        return;
                      }

                      ref
                          .read(orangeListStateImplProvider.notifier)
                          .create(
                            name: name,
                          )
                          .then(
                        (value) {
                          Navigator.pop(context);
                        },
                      );
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
}
