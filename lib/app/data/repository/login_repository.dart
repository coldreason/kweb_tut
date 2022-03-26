import 'package:kweb/app/data/model/models.dart';
import 'package:kweb/app/data/providers/login_providers.dart';

class LoginRepository {
  final LoginProvider loginProvider;

  LoginRepository({required this.loginProvider})
      : assert(loginProvider != null);

  Future<LoginReturns> login(LoginModel model) async => await loginProvider.signIn(model);

  Future<FirebaseSignUpReturns> signUp(UserInfoModel model) async => await loginProvider.signUp(model);

}
