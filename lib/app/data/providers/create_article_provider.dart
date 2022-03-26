import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kweb/app/data/model/models.dart';
import 'package:kweb/constants.dart';

class CreateArticleProvider {
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

  Future<bool> addNewArticle(ArticleModel article) async {
    await articleRef.doc(article.id).set(article);
    CourseModel courseModel = await getCourse(article.course);
    courseModel.articleList.add(article.id);
    courseRef.doc(courseModel.id).set(courseModel);
    return true;
  }
}
