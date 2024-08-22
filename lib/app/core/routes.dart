import 'package:get/get.dart';
import 'package:tasks/app/core/bindings/project_binding.dart';
import 'package:tasks/app/core/bindings/task_binding.dart';
import 'package:tasks/app/modules/auth/login.dart';
import 'package:tasks/app/modules/auth/regester.dart';
import 'package:tasks/app/modules/project/view.dart';
import 'package:tasks/app/modules/task/view.dart';
import 'package:tasks/app/modules/task/widgets/add_task.dart';

import 'bindings/auth_binding.dart';


class AppPages {
  static const INITIAL = '/login';

  static final routes = [
    GetPage(
      name: '/projects',
      page: () => const ProjectPage(),
      binding: ProjectBinding()
    ),
    GetPage(
      name: '/tasks',
      page: () => TaskPage(),
      arguments: 'index',
      binding: TaskBinding()
    ),
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: AuthBinding()
    ),
    GetPage(
        name: '/register',
        page: () => const RegisterPage(),
        binding: AuthBinding()
    ),
    GetPage(
       transition: Transition.leftToRightWithFade,
        name: '/addTask',
        page: () => AddTask(),
        arguments: 'index',
        binding: TaskBinding()
    ),
  ];
}