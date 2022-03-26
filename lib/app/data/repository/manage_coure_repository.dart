import '../model/models.dart';
import '../providers/manage_course_provider.dart';

class ManageCourseRepository {
  final ManageCourseProvider manageCourseProvider;

  ManageCourseRepository({required this.manageCourseProvider})
      : assert(manageCourseProvider != null);

  late ProfessorModel _model;
  List<CourseModel> _courseList = [];

  get model => this._model;
  get courseList => this._courseList;

  Future<bool> updateProfessorInfo(String id) async {
    _model = await manageCourseProvider.getProfessorModel(id);
    _courseList = await manageCourseProvider.getCourseList(_model.courseIdList);
    return true;
  }

  Future<bool> enrollNewCourse(CourseModel course) => manageCourseProvider.enrollNewCourse(course);
}
