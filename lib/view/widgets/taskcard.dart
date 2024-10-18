import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/data/models/taskmodel.dart';
import 'package:tasks/providers/taskprovider.dart';
import 'package:tasks/view/screens/taskdeatails.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          final Task task = taskProvider.tasks[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              child: Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red,
                    child: Icon(Icons.restore_from_trash_outlined),),
                  onDismissed: (direction) {
                    taskProvider.removeTask(index);
                  },
                  child: Stack(
                      children: [
                        if(task.isCompleted) Positioned.fill(child: Container(
                          child: Divider(thickness: 4, color: Colors.grey,),)),
                        ListTile(
                          title: Text(task.title, style: TextStyle(
                              decoration: task.isCompleted ? TextDecoration
                                  .lineThrough : TextDecoration.none
                          ),
                          ),
                          subtitle: Text(
                              DateFormat('yyyy-MM-dd').format(task.dueDate)),
                          trailing: IconButton(
                            icon: Icon(
                                task.isCompleted ? Icons.check_box : Icons
                                    .check_box_outline_blank),
                            onPressed: () {
                              taskProvider.toggleComplete(index);
                            },
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  TaskDetailScreen(task: task, index: index)),
                            );
                          },
                        ),
                      ])
              ),
            ),
          );
        });}
}