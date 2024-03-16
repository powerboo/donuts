// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// CreateModalGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sample_pj/donuts/state/domain/freezed_class.list_state_impl.dart';

Future<void> freezedClassCreateModal({required BuildContext context}) async {
  await showModalBottomSheet(
    context: context,
    builder: (_) {
      return HookConsumer(
        builder: (context, ref, child) {
          // --------------  text field ----------------
          final intValueController = useTextEditingController();
          final nullableIntController = useTextEditingController();
          final freezedClassController = useTextEditingController();
          final nullableStringController = useTextEditingController();

          // --------------  state ----------------
          final intValueState = useState<int?>(null);
          final nullableIntState = useState<int?>(null);
          final freezedClassState = useState<String?>(null);
          final nullableStringState = useState<String?>(null);

          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("intValue"),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: intValueController,
                          onChanged: (value) {
                            final val = value as int;
                            intValueState.value = val;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("nullableInt"),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: nullableIntController,
                          onChanged: (value) {
                            final val = value as int?;
                            nullableIntState.value = val;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("freezedClass"),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: freezedClassController,
                          onChanged: (value) {
                            final val = value as String;
                            freezedClassState.value = val;
                          },
                        ),
                      ),
                    ],
                  ),
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
                  ElevatedButton(
                    onPressed: () async {
                      final intValue = intValueState.value;
                      final nullableInt = nullableIntState.value;
                      final freezedClass = freezedClassState.value;
                      final nullableString = nullableStringState.value;

                      if (intValue == null) {
                        return;
                      }
                      if (nullableInt == null) {
                        return;
                      }
                      if (freezedClass == null) {
                        return;
                      }
                      if (nullableString == null) {
                        return;
                      }

                      ref
                          .read(freezedClassListStateImplProvider.notifier)
                          .create(
                            intValue,
                            nullableInt,
                            freezedClass: freezedClass,
                            nullableString: nullableString,
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
