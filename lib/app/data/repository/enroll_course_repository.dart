import 'package:kweb/app/data/providers/enroll_course_provider.dart';

import '../model/models.dart';

class EnrollCourseRepository {
  final EnrollCourseProvider enrollCourseProvider;

  EnrollCourseRepository({required this.enrollCourseProvider})
      : assert(enrollCourseProvider != null);

  List<CourseModel> _myCourseList = [];
  List<CourseModel> _availableCourseList = [];
  List<ArticleModel> _articleList = [];
  late StudentModel _studentModel;


  get myCourseList => this._myCourseList;
  get availableCourseList => this._availableCourseList;
  get studentModel => this._studentModel;
  get articleList => this._articleList;

  Future<bool> update(String id) async {
    _studentModel = await enrollCourseProvider.getStudentModel(id);
    _myCourseList = await enrollCourseProvider.getCourseList(_studentModel.courseIdList);
    _availableCourseList = await enrollCourseProvider.getAvailableCourse(_studentModel);
    _articleList = await enrollCourseProvider.getAllCourseAriticle(_studentModel);
    return true;
  }

  Future<bool> enrollNewCourse(String userId, String courseId) => enrollCourseProvider.enrollNewCourse(userId,courseId);
}
