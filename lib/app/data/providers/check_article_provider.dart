import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kweb/app/data/model/models.dart';
import 'package:kweb/constants.dart';

class CheckArticleProvider {
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


  Future<CourseModel> getCourse(String id) async {
    DocumentSnapshot<CourseModel> model = await courseRef.doc(id).get();
    return model.data()!;
  }


  Future<List<ArticleModel>> getCourseAriticle(CourseModel course) async{
    CourseModel myCourse = await getCourse(course.id);
    List<ArticleModel> MyArticleList = [];

    for(int i = 0;i<myCourse.articleList.length/10;i++){
      List<String> smallList = (myCourse.articleList.length>(i+1)*10)?myCourse.articleList.sublist(i*10,(i+1)*10):myCourse.articleList.sublist(i*10);
      QuerySnapshot<ArticleModel> querySnapshot = await articleRef.where(FieldPath.documentId,whereIn: smallList).get();
      querySnapshot.docs.forEach((element) {
        MyArticleList.add(element.data());
      });
    }
    MyArticleList.sort((a,b)=>b.timestamp.compareTo(a.timestamp));
    return MyArticleList;
  }
}

