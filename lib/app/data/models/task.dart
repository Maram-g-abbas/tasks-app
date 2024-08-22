// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

import 'package:tasks/app/data/models/project.dart';


Task taskFromJson(String str) => Task.fromJson(json.decode(str));
List<Task> tasksFromJson(String str) => List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));
String tasksToJson(List<Task> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  String title;
  String description;
  String priority;
  String deadline;
  String projectId;
  int status;
  DateTime updatedAt;
  DateTime createdAt;
  int? id;
  // Project project;

  Task({
    required this.title,
    required this.description,
    required this.priority,
    required this.deadline,
    required this.projectId,
    this.status = 0,
    required this.updatedAt,
    required this.createdAt,
    this.id,
    // required this.project,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    title: json["title"],
    description: json["description"],
    priority: json["priority"],
    deadline: json["deadline"],
    projectId: json["project_id"],
    status: json["status"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    // project: Project.fromJson(json["project"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "priority": priority,
    "deadline": deadline,
    "project_id": projectId,
    "status" : status,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    // "id": id,
    // "project": project.toJson(),
  };
}


