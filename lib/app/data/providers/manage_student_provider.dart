import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kweb/app/data/model/models.dart';
import 'package:kweb/constants.dart';

class ManageStudentProvider {
  CollectionReference<StudentModel> studentRef = FirebaseFirestore.instance
      .collection(FirestoreConstants.student)
      .withConverter<StudentModel>(
        fromFirestore: (snapshot, _) => StudentModel.fromJson(snapshot.data()!),
        toFirestore: (StudentModel, _) => StudentModel.toJson(),
      );

  CollectionReference<CourseModel> courseRef = FirebaseFirestore.instance
      .collection(FirestoreConstants.course)
      .withConverter<CourseModel>(
        fromFirestore: (snapshot, _) => CourseModel.fromJson(snapshot.data()!),
        toFirestore: (CourseModel, _) => CourseModel.toJson(),
      );

  Future<CourseModel> getCourse(String courseId) async {
    DocumentSnapshot<CourseModel> k = await courseRef.doc(courseId).get();
    return k.data()!;
  }

  Future<bool> deleteStudent(String studentId, CourseModel course) async {
    for (int i = 0; i < course.student.length; i++) {
      if (course.student[i].hashCode == studentId.hashCode) {
        course.student.remove(course.student[i]);
      }
    }
    await courseRef.doc(course.id).set(course);

    DocumentSnapshot<StudentModel> stud = await studentRef.doc(studentId).get();
    StudentModel student = stud.data()!;
    for (int i = 0; i < student.courseIdList.length; i++) {
      if (student.courseIdList[i].hashCode == course.id.hashCode) {
        student.courseIdList.remove(student.courseIdList[i]);
      }
    }
    await studentRef.doc(studentId).set(student);
    return true;
  }

  Future<List<StudentModel>> getCourseStudentModel(CourseModel course) async {
    List<StudentModel> studentList = [];
    for (int i = 0; i < course.student.length; i++) {
      DocumentSnapshot<StudentModel> k =
          await studentRef.doc(course.student[i]).get();
      studentList.add(k.data()!);
    }
    return studentList;
  }
}
