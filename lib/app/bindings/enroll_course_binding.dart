import 'package:get/get.dart';
import 'package:kweb/app/controller/enroll_course_controller.dart';
import 'package:kweb/app/data/providers/enroll_course_provider.dart';
import 'package:kweb/app/data/repository/enroll_course_repository.dart';


class EnrollCourseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnrollCourseController>(() {
      return EnrollCourseController(repository: EnrollCourseRepository(enrollCourseProvider: EnrollCourseProvider()));
    });
  }
}