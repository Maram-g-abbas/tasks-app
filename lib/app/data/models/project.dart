// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);

import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:tasks/app/data/models/task.dart';

List<Project> projectsFromJson(String str) => List<Project>.from(json.decode(str).map((x) => Project.fromJson(x)));
Project projectFromJson(String str) => Project.fromJson(jsonDecode(str));
String projectsToJson(List<Project> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
String projectToJson(Project project) => jsonEncode(project.toJson());

class Project extends Equatable{
  int? id;
  String name;
  String description;
  List<Task>? tasks;
  int progress;
  DateTime? createdAt = DateTime.now();
  DateTime? updatedAt = DateTime.now();
  String color;

  Project({
    this.id,
    required this.name,
    required this.description,
    this.tasks,
    required this.progress,
     this.createdAt,
     this.updatedAt,
    this.color='0xFF756BFC'
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
    progress: json["progress"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "progress": progress,
  };

  @override
  List<Object?> get props => [name];
}


