import 'package:get/get.dart';
import 'package:kweb/app/controller/manage_course_controller.dart';
import 'package:kweb/app/data/providers/manage_course_provider.dart';
import 'package:kweb/app/data/repository/manage_coure_repository.dart';

class ManageCourseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageCourseController>(() {
      return ManageCourseController(repository: ManageCourseRepository(manageCourseProvider: ManageCourseProvider()));
    });
  }
}