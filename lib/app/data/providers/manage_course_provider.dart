import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kweb/app/data/model/models.dart';
import 'package:kweb/constants.dart';

class ManageCourseProvider {

  CollectionReference<ProfessorModel> profRef = FirebaseFirestore.instance
      .collection(FirestoreConstants.professor).withConverter<ProfessorModel>(
  fromFirestore: (snapshot, _)=> ProfessorModel.fromJson(snapshot.data()!),
  toFirestore: (ProfessorModel, _) => ProfessorModel.toJson(),
  );

  CollectionReference<CourseModel> courseRef = FirebaseFirestore.instance
      .collection(FirestoreConstants.course).withConverter<CourseModel>(
    fromFirestore: (snapshot, _) => CourseModel.fromJson(snapshot.data()!),
    toFirestore: (CourseModel, _) => CourseModel.toJson(),
  );

  Future<ProfessorModel> getProfessorModel(String id) async {
    DocumentSnapshot<ProfessorModel> model = await profRef.doc(id).get();
    if(model.exists) return model.data()!;
    return ProfessorModel(id: id, courseIdList: []);
  }

  Future<CourseModel> getCourse(String id) async {
    DocumentSnapshot<CourseModel> model = await courseRef.doc(id).get();
    return model.data()!;
  }

  Future<List<CourseModel>> getCourseList(List<String> courseIdList) async {
    List<CourseModel> courseList = [];
    for(int i = 0;i<courseIdList.length;i++){
      CourseModel k = await getCourse(courseIdList[i]);
      courseList.add(k);
    }
    print(courseList.length);
    return courseList;
  }

  Future<bool> enrollNewCourse(CourseModel course)async{

    await courseRef.doc(course.id).set(course);
    DocumentSnapshot<ProfessorModel> prof = await profRef.doc(course.professor).get();
    ProfessorModel professorModel = ProfessorModel(id: course.professor, courseIdList: [course.id]);
    if(prof.exists){
      professorModel.courseIdList.addAll(prof.data()!.courseIdList);
    }
    profRef.doc(course.professor).set(professorModel);
    return true;
  }

}
