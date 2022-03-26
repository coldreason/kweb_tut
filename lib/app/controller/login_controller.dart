import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kweb/app/data/model/models.dart';
import 'package:kweb/app/data/repository/login_repository.dart';

import '../routes/app_pages.dart';

class LoginController extends GetxController {
  final LoginRepository repository;

  LoginController({required this.repository}) : assert(repository != null);

  final TextEditingController idController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();
  RxBool isStudent = RxBool(true);

  checkTeacher() {
    isStudent.value = false;
    update();
  }

  checkStudent() {
    isStudent.value = true;
    update();
  }

  //dismissible
  login() async {
    if (idController.text.isNotEmpty && pwdController.text.isNotEmpty) {
      LoginModel _loginModel =
          LoginModel(id: idController.text, password: pwdController.text);
      LoginReturns _isloggedIn = await repository.login(_loginModel);
      if (_isloggedIn.loginReturns == FirebaseLoginReturns.Successed) {
        print('logged In successed');
        if(_isloggedIn.isStudent == true){
          Get.toNamed(Routes.enrollCourse,arguments: {'id':_isloggedIn.id});
        }
        else{
          Get.toNamed(Routes.manageCourse,arguments: {'id':_isloggedIn.id});
        }
      } else if (_isloggedIn.loginReturns == FirebaseLoginReturns.PasswordIncorrect) {
        print('password Incorrect');
      } else if (_isloggedIn.loginReturns == FirebaseLoginReturns.IDNotExist) {
        print('id not exist');
      }
    }
  }

  signUp() async {
    if (idController.text.isNotEmpty &&
        pwdController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        studentIdController.text.isNotEmpty) {
      UserInfoModel _userInfoModel = UserInfoModel(
          id: idController.text,
          password: pwdController.text,
          name: nameController.text,
          studentId: studentIdController.text,
          isStudent: isStudent.value);
      FirebaseSignUpReturns _isSignedIn =
          await repository.signUp(_userInfoModel);
      if (_isSignedIn == FirebaseSignUpReturns.Successed) {
        if(_userInfoModel.isStudent == true){
          Get.toNamed(Routes.enrollCourse,arguments: {'id':_userInfoModel.id});
        }
        else{
          Get.toNamed(Routes.manageCourse,arguments: {'id':_userInfoModel.id});
        }
      } else if (_isSignedIn == FirebaseSignUpReturns.IDExist) {
        print('id already exist');
      }
    }
  }
}
