import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:tasks/app/core/utils/extensions.dart';
import 'package:tasks/app/core/values/colors.dart';
import 'package:tasks/app/data/api/project_services.dart';
import 'package:tasks/app/data/api/task_services.dart';
import 'package:tasks/app/data/models/project.dart';
import 'package:tasks/app/data/models/task.dart';

class TaskController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final editController = TextEditingController();
  final desEditController = TextEditingController();
  RxInt chipIndex = 0.obs;
  RxList<Project> projects = <Project>[].obs;
  RxList<Task> tasks = <Task>[].obs;
  final List<String> proiroty=['','',''].obs;
  bool checkbox=false;
  @override
  void onInit(){
    super.onInit();
    fetchProjects();

  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeChipIndex(int value){
    chipIndex(value);
  }

  bool addProject(Project project){
    if(projects.contains(project)){
      return false;
    }
    ProjectServices.addProject(project);
    projects.add(project);
    return true;
  }

  Future<void> fetchProjects() async {
    var projects = await ProjectServices.fetchProjects();
    final random = Random();
    this.projects(projects);
    this.projects.forEach((project) {
      final randomIndex = random.nextInt(colors.length);
      project.color = colors[randomIndex].toHex();
    });
    update();
  }

  void onChanged(bool value,Task task)async {
    checkbox = value;
    task.status = value ? 1 : 0 ;
    await TaskServices.updateTaskStatuse(task.status,task.id);
    await fetchProjects();

    update();
  }

  Future<List<Task>> fetchTasks(index) async {
    var projectID = projects[index].id;
    var tasks = await TaskServices.fetchTasks(projectID);
    // final random = Random();
    // this.tasks(tasks);
    return tasks;
    //
    // this.projects.forEach((project) {
    //   final randomIndex = random.nextInt(colors.length);
    //   project.color = colors[randomIndex].toHex();
    // });
  }

  bool addTask(Task task){
    if(tasks.contains(task)){
      return false;
    }
    tasks.add(task);
    TaskServices.addTask(task);
    update();
    return true;
  }
}













