import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/core/bindings/project_binding.dart';
import 'app/core/routes.dart';
import 'app/modules/project/view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Task',
      home: const ProjectPage(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: ProjectBinding(),

      builder: EasyLoading.init(),
    );
  }
}
