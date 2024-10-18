import 'package:flutter/material.dart';
import 'package:tasks/data/models/taskmodel.dart';
import 'package:tasks/providers/taskprovider.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _dueDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                _dueDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
              },
              child: const Text('Select Due Date'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                final task = Task(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  dueDate: _dueDate ?? DateTime.now(),
                );
                Provider.of<TaskProvider>(context, listen: false).addTask(task);
                // Provider.of<TaskProvider>(context, listen: true).sendNotification();
                Navigator.pop(context);
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}