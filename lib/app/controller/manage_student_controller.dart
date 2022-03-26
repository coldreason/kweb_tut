import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kweb/app/data/model/models.dart';
import 'package:kweb/app/data/repository/manage_student_repository.dart';
import 'package:kweb/constants.dart';

class ManageStudentController extends GetxController {
  final ManageStudentRepository repository;

  ManageStudentController({required this.repository})
      : assert(repository != null);

  @override
  void onInit() async {
    super.onInit();
    await initialize();
  }

  Future<bool> initialize() async {
    String k = Get.arguments[FirestoreConstants.id];
    String courseId = Get.arguments[FirestoreConstants.course];
    await repository.update(courseId);
    courseModel = repository.model;
    studentModelList.value = repository.studentList;
    update();
    return true;
  }

  CourseModel courseModel = CourseModel(professor: '', name: '', articleList: [], student: [], id: '');
  RxList<StudentModel> studentModelList = RxList();

  Future<bool> deleteStudent(String id) async {
    await repository.deleteStudent(id);
    await repository.update(courseModel.id);
    courseModel = repository.model;
    studentModelList.value = repository.studentList;
    update();
    return true;
  }

}
