import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kweb/app/data/model/models.dart';
import 'package:kweb/constants.dart';

class EnrollCourseProvider {
  CollectionReference<ArticleModel> articleRef = FirebaseFirestore.instance
      .collection(FirestoreConstants.article)
      .withConverter<ArticleModel>(
    fromFirestore: (snapshot, _) => ArticleModel.fromJson(snapshot.data()!),
    toFirestore: (ArticleModel, _) => ArticleModel.toJson(),
  );

  CollectionReference<CourseModel> courseRef = FirebaseFirestore.instance
      .collection(FirestoreConstants.course)
      .withConverter<CourseModel>(
    fromFirestore: (snapshot, _) => CourseModel.fromJson(snapshot.data()!),
    toFirestore: (CourseModel, _) => CourseModel.toJson(),
  );

  CollectionReference<StudentModel> studentRef = FirebaseFirestore.instance
      .collection(FirestoreConstants.student)
      .withConverter<StudentModel>(
    fromFirestore: (snapshot, _) => StudentModel.fromJson(snapshot.data()!),
    toFirestore: (StudentModel, _) => StudentModel.toJson(),
  );

  Future<CourseModel> getCourse(String id) async {
    DocumentSnapshot<CourseModel> model = await courseRef.doc(id).get();
    return model.data()!;
  }

  Future<StudentModel> getStudentModel(String id) async {
    DocumentSnapshot<StudentModel> model = await studentRef.doc(id).get();
    if(model.exists) return model.data()!;
    return StudentModel(id: id, courseIdList: []);
  }

  Future<List<CourseModel>> getCourseList(List<String> courseIdList) async {
    List<CourseModel> courseList = [];
    for(int i = 0;i<courseIdList.length;i++){
      CourseModel k = await getCourse(courseIdList[i]);
      courseList.add(k);
    }
    return courseList;
  }

  Future<List<CourseModel>> getAllCourse() async{
    QuerySnapshot<CourseModel> model = await courseRef.get();
    List<CourseModel> courseList = model.docs.map((QueryDocumentSnapshot<CourseModel> doc)=>doc.data()).toList();
    return courseList;
  }

  Future<List<CourseModel>> getAvailableCourse(StudentModel studentModel) async{
    List<CourseModel> allCourseList = await getAllCourse();

    for(int i = 0;i<studentModel.courseIdList.length;i++){
      CourseModel course = allCourseList.singleWhere((element) => element.id == studentModel.courseIdList[i]);
      allCourseList.remove(course);
    }
    return allCourseList;
  }

  Future<bool> enrollNewCourse(String userId,String courseId) async {
    CourseModel course = (await courseRef.doc(courseId).get()).data()!;
    for(int i = 0;i<course.articleList.length;i++){
      if(course.articleList[i].hashCode == userId.hashCode)return false;
    }
    course.student.add(userId);
    await courseRef.doc(courseId).set(course);

    DocumentSnapshot<StudentModel> stud = await studentRef.doc(userId).get();
    StudentModel studentModel = StudentModel(id: userId, courseIdList: [course.id]);
    if(stud.exists){
      studentModel.courseIdList.addAll(stud.data()!.courseIdList);
    }
    await studentRef.doc(userId).set(studentModel);
    return true;
  }

  Future<List<ArticleModel>> getAllCourseAriticle(StudentModel studentModel) async{
    List<CourseModel> myCourseList = await getCourseList(studentModel.courseIdList);
    List<ArticleModel> MyArticleList = [];
    List<String> myArticleIdList = [];
    for(int i = 0;i<myCourseList.length;i++){
      myArticleIdList.addAll(myCourseList[i].articleList);
    }
    for(int i = 0;i<myArticleIdList.length/10;i++){
      List<String> smallList = (myArticleIdList.length>(i+1)*10)?myArticleIdList.sublist(i*10,(i+1)*10):myArticleIdList.sublist(i*10);
      QuerySnapshot<ArticleModel> querySnapshot = await articleRef.where(FieldPath.documentId,whereIn: smallList).get();
      querySnapshot.docs.forEach((element) {
        MyArticleList.add(element.data());
      });
    }
    MyArticleList.sort((a,b)=>b.timestamp.compareTo(a.timestamp));
    return MyArticleList;
  }
}

