/*this class represents the main controller for all auth views including
loin , registration , logout , and get profile
along with all widgets used in these views
 */

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasks/app/data/api/auth_services.dart';
import 'package:tasks/app/data/models/auth.dart';

class AuthController extends GetxController{

  TextEditingController passwordController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  final userData= GetStorage();

  Future<bool> login() async{
    //getting data from the form
    String email= emailController.text;
    String password = passwordController.text;

    Auth auth=Auth(email: email, password: password);
    var authenticated= await AuthService.login(auth);

    if(!authenticated) {
      return false;
    }
    emailController.clear();
    passwordController.clear();
    route();
    return true;
  }
  /* after successfully authentication this method is used to redirect the user
  the there views according to his role
   */
  void route(){
   String role = userData.read("role");
   print("rrr $role");
   String rout="";
   switch (role){
     case "user":
       rout = "/projects";
       break;
     case "admin":
       rout = "/projects";
       break;
     case "editor":
       rout = "/projects";
       break;
   }
   Get.offNamed(rout);
  }

  Future<bool> register() async{
    String email= emailController.text;
    String password = passwordController.text;
    String name = nameController.text;
    String confirmPassword = confirmPasswordController.text;
    var user= await AuthService.register(name,email,password,confirmPassword);
    emailController.clear();
    passwordController.clear();
    return true;
  }
}