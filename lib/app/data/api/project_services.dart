import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tasks/app/core/utils/config.dart';
import 'package:tasks/app/data/models/project.dart';




class ProjectServices {
  static const String baseUrl = Config.baseUrl;
  static final userData= GetStorage();

  static Future<List<Project>> fetchProjects()async{
    final response = await http.get(
      Uri.parse('$baseUrl/project'),
      headers: {'Content-Type': 'application/json',
        'Accept' : 'application/json',
        'Authorization': "Bearer ${userData.read("token")}"},
    );
    final data = projectsFromJson(response.body);
    print(data);
    return data; // Assuming the response contains a token and user information
  }

  static Future<void> addProject(Project project) async {
    final response = await http.post(
      Uri.parse('$baseUrl/project'),
      body: projectToJson(project),
      headers: {'Content-Type': 'application/json',
        'Accept' : 'application/json',
        'Authentication': "berear a",
        'Authorization': "Bearer ${userData.read("token")}"},
    );

    final data = jsonDecode(response.body);
    print(data.toString()); // Assuming the response contains a token and user information
  }


}