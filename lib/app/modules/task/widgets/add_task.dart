import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/app/core/utils/extensions.dart';
import 'package:tasks/app/core/values/colors.dart';
import 'package:tasks/app/data/models/task.dart';
import 'package:tasks/app/modules/task/controller.dart';
import 'package:tasks/app/widgets/input-test-field.dart';
import 'package:tasks/app/widgets/proirty.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});
  final int index=Get.arguments['index'];
  @override
  Widget build(BuildContext context) {
    TaskController controller = Get.find<TaskController>();
    List<Text> proierities = getProirties();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.back();
        }, icon: Icon(Icons.clear)),
        actions: [
          TextButton(onPressed: () {}, child: Text("Done"))
        ],
      ),
      body: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputTextField(textController: controller.editController,hint: 'Task',),
                InputTextField(textController: controller.desEditController,hint: 'Description',),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0.wp),
                  child: Wrap(
                    children: proierities.map((e) =>
                        Obx(() {
                          final index = proierities.indexOf(e);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ChoiceChip(
                              selectedColor: Colors.grey,
                              pressElevation: 0,
                              backgroundColor: Colors.transparent,
                              label: e,
                              selected: controller.chipIndex.value == index,
                              onSelected: (bool selected) {
                                // taskCtrl.changeChipIndex(index);
                                controller.chipIndex.value =
                                selected ? index : 0;
                              },
                            ),
                          );
                        }
                        )
                    ).toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0.sp),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          minimumSize: const Size(150, 40)
                      ),
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          Get.back();
                          Task task = Task(title: controller.
                          editController.text,
                              description: controller.desEditController.text,
                              priority: proierities[controller.chipIndex.value]
                                  .data ?? "",
                              deadline: "2024-09-01",
                              projectId: controller.projects[index].id!
                                  .toString(),
                              updatedAt: DateTime.now(),
                              createdAt: DateTime.now());
                          controller.addTask(task);
                        }
                      },
                      child: const Text("Confirm",style: TextStyle(color: Colors.white),)),
                )
              ],
            ),
          )
    );
  }}
