import 'package:flutter/cupertino.dart';
import 'package:tasks/data/models/taskmodel.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  // Method to add a task and automatically sort the list
  void addTask(Task task) {
    _tasks.add(task);
    _sortTasks();
    notifyListeners();
  }

  // Method to remove a task
  void removeTask(int index) {
    _tasks.removeAt(index);
    _sortTasks();
    notifyListeners();
  }

  // Sorting logic (modify this if sorting by a custom object)
  void _sortTasks() {
    _tasks.sort((a, b) => a.dueDate.compareTo(b.dueDate));
  }


  void updateTask(int index, Task task) {
    _tasks[index] = task;
    notifyListeners();
  }


  void toggleComplete(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }

  List<Task> searchTasks(String query) {
    return _tasks.where((task) => task.title.contains(query)).toList();
  }
}