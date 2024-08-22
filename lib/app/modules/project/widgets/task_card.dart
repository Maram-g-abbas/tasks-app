import 'package:flutter/material.dart';
import 'package:tasks/app/core/utils/extensions.dart';
import 'package:tasks/app/data/models/project.dart';
import 'package:tasks/app/modules/project/controller.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tasks/app/modules/task/view.dart';

class TaskCard extends StatelessWidget {
  final projCtrl =Get.find<ProjectController>();
  final int index;
   TaskCard({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    var project = projCtrl.projects[index];
    final color =HexColor.fromHex(project.color);
    final squarWidth = Get.width - 12.0.wp;
    return InkWell(
      onTap: (){
        Get.toNamed('/tasks', arguments: {'index': index});
      },
      child: Container(
        width: squarWidth / 2,
        height: squarWidth / 2,
        margin: EdgeInsets.all(3.0.wp),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 7,
              offset: const Offset(0,7)
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepProgressIndicator(
              totalSteps: 100,
              currentStep: project.progress,
              size: 5,
              padding: 0,
              selectedGradientColor: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color.withOpacity(0.5),color]
              ),
              unselectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white,Colors.white]
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.0.wp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.0.wp,),
                  Text(
                    '${project.tasks?.length ?? 0} Task',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


















