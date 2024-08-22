import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/app/core/utils/extensions.dart';
import 'package:tasks/app/modules/project/controller.dart';
import 'package:tasks/app/modules/project/widgets/add_card.dart';
import 'package:tasks/app/modules/project/widgets/task_card.dart';

class ProjectPage extends GetView<ProjectController> {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Text('Projects',
              style: TextStyle(
                fontSize: 24.0.sp,
                fontWeight: FontWeight.bold
              ),),
            ),
          Obx(() {
            int index = 0;
            return GridView.count(crossAxisCount: 2,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [

                ...controller.projects.value.map((element) {

               return TaskCard(index: index++);
    }
                ).toList(),
                AddCard()
              ],
            );
  }
          )
          ],
        ),
      )
    );
  }
}















