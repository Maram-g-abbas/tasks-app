import 'package:get/get.dart';
import 'package:tasks/app/modules/auth/controller.dart';

class AuthBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(
    ));
  }

}