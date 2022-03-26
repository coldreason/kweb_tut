import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kweb/app/data/model/models.dart';

import '../../../constants.dart';

class LoginProvider {
  Future<LoginReturns> signIn(LoginModel model) async {
    DocumentSnapshot<Map<String, dynamic>> userInfo = await FirebaseFirestore
        .instance
        .collection(FirestoreConstants.user)
        .doc(model.id)
        .get();

    if (userInfo.exists == false)
      return LoginReturns(
          loginReturns: FirebaseLoginReturns.IDNotExist,
          id: model.id,
          isStudent: true);

    if (model.password.hashCode.hashCode ==
        userInfo.get(FirestoreConstants.pwd).hashCode)
      return LoginReturns(
          loginReturns: FirebaseLoginReturns.Successed,
          id: model.id,
          isStudent: userInfo.get(FirestoreConstants.isStudent));
    ;
    return LoginReturns(
        loginReturns: FirebaseLoginReturns.PasswordIncorrect,
        id: model.id,
        isStudent: true);
  }

  Future<FirebaseSignUpReturns> signUp(UserInfoModel model) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection(FirestoreConstants.user)
            .doc(model.id);
    DocumentSnapshot<Map<String, dynamic>> data = await documentReference.get();

    if (data.exists) return FirebaseSignUpReturns.IDExist;

    FirebaseFirestore.instance.runTransaction((transaction) async {
      await transaction.set(
        documentReference,
        {
          FirestoreConstants.id: model.id,
          FirestoreConstants.pwd: model.password.hashCode,
          FirestoreConstants.name: model.name,
          FirestoreConstants.studentId: model.studentId,
          FirestoreConstants.isStudent: model.isStudent,
        },
      );
    });

    return FirebaseSignUpReturns.Successed;
  }
}
