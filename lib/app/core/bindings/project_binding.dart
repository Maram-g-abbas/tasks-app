import 'package:get/get.dart';
// import 'package:tasks/app/data/providers/project/provider.dart';
// import 'package:tasks/app/data/services/storage/repository.dart';
import 'package:tasks/app/modules/project/controller.dart';

class ProjectBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ProjectController(
        // projectRepository: ProjectRepository(
        //   projectProvider: ProjectProvider(),
        // )
    ));
  }

}