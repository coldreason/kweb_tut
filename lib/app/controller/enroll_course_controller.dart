import 'package:get/get.dart';
import 'package:kweb/app/data/model/models.dart';
import 'package:kweb/app/data/repository/enroll_course_repository.dart';
import 'package:kweb/app/routes/app_pages.dart';

import '../../constants.dart';

class EnrollCourseController extends GetxController {
  final EnrollCourseRepository repository;

  EnrollCourseController({required this.repository})
      : assert(repository != null);

  @override
  void onInit() async {
    super.onInit();
    await initialize();
  }

  late StudentModel studentModel;
  RxList<CourseModel> availableCourseList = RxList();
  RxList<CourseModel> myCourseList = RxList();
  RxList<ArticleModel> myArticleList = RxList();

  Future<bool> initialize() async {
    final userId = Get.arguments[FirestoreConstants.id];
    await repository.update(userId);
    studentModel =  repository.studentModel;
    availableCourseList.value = repository.availableCourseList;
    myCourseList.value = repository.myCourseList;
    myArticleList.value = repository.articleList;
    update();
    return true;
  }

  void enrollCourse(String courseId) {

    repository.enrollNewCourse(studentModel.id, courseId);
    repository.update(studentModel.id);
    availableCourseList.value = repository.availableCourseList;
    myCourseList.value = repository.myCourseList;
    myArticleList.value = repository.articleList;
    update();
  }

  toViewArticle(ArticleModel model){
    Get.toNamed(Routes.viewArticle,arguments: {FirestoreConstants.article:model});
  }

  void toCheckArticle(String courseId){
    Get.toNamed(Routes.checkArticle,arguments: {FirestoreConstants.id: studentModel.id,FirestoreConstants.course:courseId});
  }
}
