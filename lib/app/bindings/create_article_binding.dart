import 'package:get/get.dart';
import 'package:kweb/app/controller/create_article_controller.dart';
import 'package:kweb/app/data/providers/create_article_provider.dart';
import 'package:kweb/app/data/repository/create_article_repository.dart';


class CreateArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateArticleController>(() {
      return CreateArticleController(repository: CreateArticleRepository(createArticleProvider: CreateArticleProvider()));
    });
  }
}