import 'package:get/get.dart';
import 'package:kweb/app/controller/view_article_controller.dart';


class ViewArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewArticleController>(() {
      return ViewArticleController();
    });
  }
}