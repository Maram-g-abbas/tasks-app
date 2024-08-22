import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tasks/app/modules/auth/controller.dart';
import 'package:tasks/app/widgets/input-test-field.dart';

class RegisterPage extends GetView<AuthController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  InputTextField(textController: controller.nameController,hint: "Name",),
                  InputTextField(textController: controller.emailController,hint: "Email",),
                  InputTextField(textController: controller.passwordController,hint: "Password",),
                  InputTextField(textController: controller.confirmPasswordController,hint: "Confirm Password",),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: (){
                      EasyLoading.showProgress(1);
                      controller.register().then((value) {
                        EasyLoading.dismiss();
                        return value?
                        EasyLoading.showSuccess('register success'):
                          EasyLoading.showError('invalid input');

                      }
                      );

                    }, child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('register'),
                    )),
                  ),


                  TextButton(onPressed: (){
                    Get.toNamed("/login");
                  }, child: Text("login"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


