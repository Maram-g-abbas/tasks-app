import 'package:get/get.dart';
// import 'package:tasks/app/data/providers/project/provider.dart';
// import 'package:tasks/app/data/services/storage/repository.dart';
// import 'package:tasks/app/modules/project/controller.dart';
import 'package:tasks/app/modules/task/controller.dart';

class TaskBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => TaskController(
        // taskRepository: ProjectRepository(
          // projectProvider: ProjectProvider(),
        // )
    ));
  }

}