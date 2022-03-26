import 'package:get/get.dart';
import 'package:kweb/app/data/model/models.dart';
import 'package:kweb/app/data/repository/check_article_repository.dart';
import 'package:kweb/app/routes/app_pages.dart';

import '../../constants.dart';

class CheckArticleController extends GetxController {
  final CheckArticleRepository repository;

  CheckArticleController({required this.repository})
      : assert(repository != null);

  @override
  void onInit() async {
    super.onInit();
    await initialize();
  }

  late String userId;
  late String courseId;
  RxList<ArticleModel> articleList = RxList();

  Future<bool> initialize() async {
    userId = Get.arguments[FirestoreConstants.id];
    courseId = Get.arguments[FirestoreConstants.course];
    await repository.update(courseId);
    articleList.value =  repository.articleList;
    update();
    return true;
  }

  toViewArticle(ArticleModel model){
    Get.toNamed(Routes.viewArticle,arguments: {FirestoreConstants.article:model});
  }
}
