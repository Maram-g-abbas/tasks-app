import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tasks/app/core/utils/config.dart';
import 'package:tasks/app/data/models/project.dart';
import 'package:tasks/app/data/models/task.dart';




class TaskServices {
  static const String baseUrl = Config.baseUrl;
  static final userData= GetStorage();

  static Future<List<Task>> fetchTasks(projectID)async{
    final response = await http.get(
      Uri.parse('$baseUrl/task?project_id=$projectID'),
      headers: {'Content-Type': 'application/json',
        'Accept' : 'application/json',
        'Authorization': "Bearer ${userData.read("token")}"},
    );
    print(response.body);
    final data = tasksFromJson(response.body);

    return data; // Assuming the response contains a token and user information
  }

  static Future<void> updateTaskStatuse(int status,taskID)async {
    final response = await http.put(
      Uri.parse('$baseUrl/task/$taskID/status'),
      body: jsonEncode({ "status" : status}),
      headers: {'Content-Type': 'application/json',
        'Accept' : 'application/json',
        'Authorization': "Bearer ${userData.read("token")}"},
    );
    print(response.body);
  }

  static Future<void> addTask(Task task) async {
    final response = await http.post(
      Uri.parse('$baseUrl/task'),
      body: taskToJson(task),
      headers: {'Content-Type': 'application/json',
        'Accept' : 'application/json',
        'Authorization': "Bearer ${userData.read("token")}"},
    );
print(response.body);
    final data = jsonDecode(response.body);
    print(data.toString()); // Assuming the response contains a token and user information
  }
  
}