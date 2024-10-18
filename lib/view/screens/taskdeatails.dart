import 'package:flutter/material.dart';
import 'package:tasks/data/models/taskmodel.dart';
import 'package:tasks/providers/taskprovider.dart';
import 'package:provider/provider.dart';

// Task Detail Screen
class TaskDetailScreen extends StatelessWidget {
  final Task task;
  final int index;

  TaskDetailScreen({required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController(text: task.title);
    final _descriptionController = TextEditingController(text: task.description);

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<TaskProvider>(context, listen: false).removeTask(index);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                final updatedTask = Task(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  dueDate: task.dueDate,
                  isCompleted: task.isCompleted,
                );
                Provider.of<TaskProvider>(context, listen: false).updateTask(index, updatedTask);
                Navigator.pop(context);
              },
              child: Text('Update Task'),
            ),
          ],
        ),
      ),
    );
  }
}