import 'package:flutter/material.dart';
import 'package:tasks/app/data/models/task.dart';
import 'package:get/get.dart';
import 'package:tasks/app/modules/project/controller.dart';
class TaskCard extends StatelessWidget {
  const TaskCard({super.key,required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectController>(
      builder: (controller) {
        return ListTile(
          leading: Checkbox(value: task.status == 1? true : false , onChanged: (bool? value) {controller.onChanged(value!,task);},),
          title: Text(task.title),
          subtitle: const Text('user'),
        );
      }
    );
  }
}
