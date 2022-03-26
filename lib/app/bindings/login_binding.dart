import 'package:get/get.dart';
import 'package:kweb/app/data/providers/login_providers.dart';
import 'package:kweb/app/data/repository/login_repository.dart';
import '../controller/login_controller.dart';


class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController(repository: LoginRepository(loginProvider: LoginProvider()));
    });
  }
}