import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kweb/app/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(123, 3, 19, 1),
            body: Center(
              child: SizedBox(
                width: 300,
                height: 400,
                child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(tabs: [
                          Tab(
                            text: '로그인',
                          ),
                          Tab(
                            text: '회원가입',
                          )
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: TabBarView(
                              children: [LoginField(), SignUpField()]),
                        )
                      ],
                    )),
              ),
            )));
  }
}

class SignUpField extends StatelessWidget {
  const SignUpField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          TextField(
            controller: loginController.idController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                fillColor: Colors.white,
                filled: true,
                hintText: '아이디',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10))),
          ),
          TextField(
            controller: loginController.pwdController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                fillColor: Colors.white,
                filled: true,
                hintText: '비밀번호',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10))),
          ),
          TextField(
            controller: loginController.nameController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                fillColor: Colors.white,
                filled: true,
                hintText: '이름',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10))),
          ),
          TextField(
            controller: loginController.studentIdController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                fillColor: Colors.white,
                filled: true,
                hintText: '학번',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10))),
          ),
          GetBuilder<LoginController>(builder: (_){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text('교원',style: TextStyle(color: Colors.white)),
                    Radio(
                        value: false,
                        groupValue: loginController.isStudent.value,
                        onChanged: (value) {
                          loginController.checkTeacher();
                        }),
                  ],
                ),
                Row(
                  children: [
                    Text('학생',style: TextStyle(color: Colors.white),),
                    Radio(
                        value: true,
                        groupValue: loginController.isStudent.value,
                        onChanged: (value) {
                          loginController.checkStudent();
                        })
                  ],
                ),
              ],
            );
          }),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {
              loginController.signUp();
            },
            child: Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  '회원가입',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            color: Color.fromRGBO(45, 40, 46, 1),
          )
        ],
      ),
    );
  }
}

class LoginField extends StatelessWidget {
  const LoginField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: loginController.idController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                fillColor: Colors.white,
                filled: true,
                hintText: '아이디',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10))),
          ),
          TextField(
            controller: loginController.pwdController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                fillColor: Colors.white,
                filled: true,
                hintText: '비밀번호',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            onPressed: () {
              loginController.login();
            },
            child: Text(
              '로그인',
              style: TextStyle(color: Colors.white),
            ),
            color: Color.fromRGBO(45, 40, 46, 1),
          )
        ],
      ),
    );
  }
}
