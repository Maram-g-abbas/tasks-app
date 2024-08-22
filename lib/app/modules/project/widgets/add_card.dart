import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tasks/app/core/utils/extensions.dart';
import 'package:tasks/app/core/values/colors.dart';
import 'package:tasks/app/data/models/project.dart';
import 'package:tasks/app/modules/project/controller.dart';
import 'package:get/get.dart';
import 'package:tasks/app/widgets/icons.dart';
import 'dart:math';

class AddCard extends StatelessWidget {
  final projCtrl = Get.find<ProjectController>();
   AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
            radius: 5,
            title: 'Project Title',
            content: Form(
              key: projCtrl.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                    child: TextFormField(
                      controller: projCtrl.editController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                      validator: (value){
                        if (value == null || value.trim().isEmpty){
                          return 'please enter your task name';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(12.0.sp),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          minimumSize: const Size(150, 40)
                        ),
                        onPressed: (){
                          if(projCtrl.formKey.currentState!.validate()){
                            final random = Random();
                            final randomIndex = random.nextInt(colors.length);
                            var project = Project(
                              name: projCtrl.editController.text,
                              color: colors[randomIndex].toHex(), description: 'project description', progress: 80
                            );
                            Get.back();
                            projCtrl.addProject(project) ?
                                EasyLoading.showSuccess('create success') :
                                EasyLoading.showError('Duplicated Task');
                          }
                        },
                        child: const Text("Confirm",style: TextStyle(color: Colors.white),)),
                  )
                ],
              ),
            )
          );
          projCtrl.editController.clear();
          projCtrl.changeChipIndex(0);
        },
          child: DottedBorder(
            color: Colors.grey,
            dashPattern: const [8,4],
            child: Center(
              child: Icon(Icons.add,
              size: 10.0.wp,
              color: Colors.grey,),
            ),
          ),
      ),

    );
  }
}









