import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tasks/app/modules/auth/controller.dart';
import 'package:tasks/app/widgets/input-test-field.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            // color: Colors.blue.withOpacity(0.1),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InputTextField(textController: controller.emailController,hint: "Email",),
                  InputTextField(textController: controller.passwordController,hint: "Password",),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: (){
                      EasyLoading.showProgress(1);
                      controller.login().then((value) {
                        EasyLoading.dismiss();
                        return value?
                        EasyLoading.showSuccess('login success'):
                          EasyLoading.showError('invalid credentials');

                      }
                      );

                    }, child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('login'),
                    )),
                  ),
                  
                  TextButton(onPressed: (){
                    Get.toNamed("/register");
                  }, child: const Text("create account"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
