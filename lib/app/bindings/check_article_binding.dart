import 'package:get/get.dart';
import 'package:kweb/app/controller/check_article_controller.dart';
import 'package:kweb/app/data/providers/check_article_provider.dart';
import 'package:kweb/app/data/repository/check_article_repository.dart';


class CheckArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckArticleController>(() {
      return CheckArticleController(repository: CheckArticleRepository(checkArticleProvider: CheckArticleProvider()));
    });
  }
}