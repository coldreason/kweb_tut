import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kweb/app/controller/check_article_controller.dart';
import 'package:kweb/app/controller/enroll_course_controller.dart';

class CheckArticleScreen extends StatelessWidget {
  const CheckArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(123, 3, 19, 1),
            body: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Center(
                    child: Text('게시글',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MyArticleList()
              ],
            )));
  }
}

class MyArticleList extends StatelessWidget {
  const MyArticleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CheckArticleController checkArticleController =
    Get.find<CheckArticleController>();
    return GetBuilder<CheckArticleController>(builder: (_) {
      return ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 40,
                decoration:
                BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextButton(
                    onPressed: () {
                      checkArticleController.toViewArticle(checkArticleController.articleList[index]);
                    },
                    child: Text(
                      checkArticleController.articleList.value[index].name,
                      style: TextStyle(color: Colors.white),
                    )));
          },
          itemCount: checkArticleController.articleList.value.length);
    });
  }
}