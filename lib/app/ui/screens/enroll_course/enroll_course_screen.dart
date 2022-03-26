import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kweb/app/controller/enroll_course_controller.dart';

class EnrollCourseScreen extends StatelessWidget {
  const EnrollCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EnrollCourseController enrollCourseController =
        Get.find<EnrollCourseController>();
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(123, 3, 19, 1),
            body: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(tabs: [
                      Tab(
                        child: Text(
                          '내 강의 목록',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Tab(
                          child: Text(
                        '수강 신청',
                        style: TextStyle(color: Colors.white),
                      )),
                      Tab(
                          child: Text(
                            '게시글 목록',
                            style: TextStyle(color: Colors.white),
                          )),
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TabBarView(
                            children: [MyCourseList(), AllCourseList(),MyArticleList()]),
                      ),
                    )
                  ],
                ))));
  }
}

class AllCourseList extends StatelessWidget {
  const AllCourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EnrollCourseController enrollCourseController =
        Get.find<EnrollCourseController>();

    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        GetBuilder<EnrollCourseController>(builder: (_) {
          print(enrollCourseController.availableCourseList.value.length);
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
                          enrollCourseController.enrollCourse(enrollCourseController.availableCourseList.value[index].id);
                        },
                        child: Text(////
                          enrollCourseController.availableCourseList[index].name,
                          style: TextStyle(color: Colors.white),
                        )));
              },
              itemCount: enrollCourseController.availableCourseList.value.length);
        })
      ],
    );
  }
}

class MyCourseList extends StatelessWidget {
  const MyCourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EnrollCourseController enrollCourseController =
        Get.find<EnrollCourseController>();
    return GetBuilder<EnrollCourseController>(builder: (_) {
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
                      enrollCourseController.toCheckArticle(enrollCourseController.myCourseList.value[index].id);
                    },
                    child: Text(
                      enrollCourseController.myCourseList.value[index].name,
                      style: TextStyle(color: Colors.white),
                    )));
          },
          itemCount: enrollCourseController.myCourseList.value.length);
    });
  }
}
class MyArticleList extends StatelessWidget {
  const MyArticleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EnrollCourseController enrollCourseController =
    Get.find<EnrollCourseController>();
    return GetBuilder<EnrollCourseController>(builder: (_) {
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
                      enrollCourseController.toViewArticle(enrollCourseController.myArticleList[index]);
                    },
                    child: Text(
                      enrollCourseController.myArticleList.value[index].name,
                      style: TextStyle(color: Colors.white),
                    )));
          },
          itemCount: enrollCourseController.myArticleList.value.length);
    });
  }
}

