import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tasks/app/core/utils/extensions.dart';
import 'package:tasks/app/core/values/colors.dart';
import 'package:tasks/app/core/values/proirties.dart';
import 'package:tasks/app/data/models/project.dart';
import 'package:tasks/app/data/models/task.dart';
import 'package:tasks/app/modules/project/controller.dart';
import 'package:lottie/lottie.dart';
import 'package:tasks/app/modules/task/controller.dart';
import 'package:tasks/app/modules/task/widgets/task_card.dart';

class TaskPage extends GetView<TaskController> {
   TaskPage({super.key,});
  final int index=Get.arguments['index'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          Get.toNamed("/addTask",arguments: {'index': index});
        controller.editController.clear();
        controller.changeChipIndex(0);
        },child: Icon(Icons.add),),
      body: SafeArea(
        child: Center(
          child: Padding(
                padding: EdgeInsets.all(12.0.sp),
                child: GetBuilder<TaskController>(
                  builder: (cont) {
                    return FutureBuilder(
                      future: controller.fetchTasks(index),
                      builder: (context,snapShot) {
                        if(snapShot.hasError) return Text('some thing went wrong');
                        if(snapShot.hasData) {
                          List<Task> data = snapShot.data!;
                          if(data.isEmpty) return Center(child: Lottie.asset('assets/animations/empty-tasks.json'),);
                          return GetBuilder<ProjectController>(
                            builder: (controller) {
                              Project project= controller.projects[index];
                              print("eeee ${project.progress}");
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(20.0.wp),
                                    child: Text(project.name,
                                      style: TextStyle(
                                          fontSize: 24.0.sp,
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ),
                                  CircularStepProgressIndicator(
                                    totalSteps: 100,
                                    currentStep: project.progress,
                                    stepSize: 10,
                                    selectedColor: Colors.greenAccent,
                                    unselectedColor: Colors.grey[200],
                                    padding: 0,
                                    width: 150,
                                    height: 150,
                                    selectedStepSize: 15,
                                    roundedCap: (_, __) => true,
                                  ),
                                ListView.builder(
                                shrinkWrap: true,
                                itemCount: data.length,
                                itemBuilder: (context, index) => TaskCard(task:data[index]),
                                )
                                ],
                              );
                            }
                          );
                        }
                        return const Center(child: CircularProgressIndicator(),);
                      }
                    );
                  }
                ),
              ),
        ),
      )
    );
  }
}















