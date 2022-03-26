import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kweb/app/data/model/models.dart';
import 'package:kweb/app/data/repository/manage_coure_repository.dart';
import 'package:kweb/app/routes/app_pages.dart';
import 'package:kweb/constants.dart';

class ManageCourseController extends GetxController {
  final ManageCourseRepository repository;

  ManageCourseController({required this.repository})
      : assert(repository != null);

  @override
  void onInit() async {
    super.onInit();
    await initialize();
  }

  Future<bool> initialize() async {
    String k = Get.arguments[FirestoreConstants.id];
    await repository.updateProfessorInfo(k);
    professorModel = repository.model;
    courseList.value = repository.courseList;
    update();
    return true;
  }

  ProfessorModel professorModel = ProfessorModel(id: '', courseIdList: []);
  RxList<CourseModel> courseList = RxList();
  final TextEditingController courseNameController = TextEditingController();

  Future<bool> enrollNewCourse() async {
    if (courseNameController.text.isNotEmpty) {
      CourseModel course = CourseModel(
          professor: professorModel.id,
          name: courseNameController.text,
          articleList: [],
          student: [],
          id: (courseNameController.text + professorModel.id)
              .hashCode
              .toString());
      await repository.enrollNewCourse(course);
      courseNameController.clear();
      initialize();
      update();
      return true;
    }
    return false;
  }

  tocreateArticleScreen(String courseId) {
    Get.toNamed(Routes.createArticle, arguments: {
      FirestoreConstants.id: professorModel.id,
      FirestoreConstants.course: courseId
    });
  }

  toManageStudentScreen(String courseId) {
    Get.toNamed(Routes.manageStudent, arguments: {
      FirestoreConstants.id: professorModel.id,
      FirestoreConstants.course: courseId
    });
  }
}
