// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// CreateModalGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sample_pj/donuts/state/domain/donuts_json_serializable_class.list_state_impl.dart';

Future<void> donutsJsonSerializableClassCreateModal(
    {required BuildContext context}) async {
  await showModalBottomSheet(
    context: context,
    builder: (_) {
      return HookConsumer(
        builder: (context, ref, child) {
          // --------------  text field ----------------
          final nullableStringController = useTextEditingController();
          final isOkController = useTextEditingController();

          // --------------  state ----------------
          final nullableStringState = useState<String?>(null);
          final isOkState = useState<bool?>(null);

          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("nullableString"),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: nullableStringController,
                          onChanged: (value) {
                            final val = value as String?;
                            nullableStringState.value = val;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("isOk"),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: isOkController,
                          onChanged: (value) {
                            final val = value as bool?;
                            isOkState.value = val;
                          },
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      ref
                          .read(donutsJsonSerializableClassListStateImplProvider
                              .notifier)
                          .create(
                            nullableStringState.value,
                            isOk: isOkState.value,
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
