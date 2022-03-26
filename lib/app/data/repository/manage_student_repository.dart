import 'package:kweb/app/data/providers/manage_student_provider.dart';

import '../model/models.dart';

class ManageStudentRepository {
  final ManageStudentProvider manageStudentProvider;

  ManageStudentRepository({required this.manageStudentProvider})
      : assert(manageStudentProvider != null);

  late CourseModel _model;
  List<StudentModel> _studnetList = [];

  get model => this._model;
  get studentList => this._studnetList;

  Future<bool> update(String id) async {
    _model = await manageStudentProvider.getCourse(id);
    _studnetList = await manageStudentProvider.getCourseStudentModel(_model);
    return true;
  }

  Future<bool> deleteStudent(String studentId) => manageStudentProvider.deleteStudent(studentId,_model);
}
