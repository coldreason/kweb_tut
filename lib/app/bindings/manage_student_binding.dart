import 'package:get/get.dart';
import 'package:kweb/app/data/providers/manage_student_provider.dart';
import 'package:kweb/app/data/repository/manage_student_repository.dart';

import '../controller/manage_student_controller.dart';


class ManageStudentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageStudentController>(() {
      return ManageStudentController(repository: ManageStudentRepository(manageStudentProvider: ManageStudentProvider()));
    });
  }
}