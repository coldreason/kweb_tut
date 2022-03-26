import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kweb/app/controller/manage_course_controller.dart';

class ManageCourseScreen extends StatelessWidget {
  const ManageCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        '강의 등록',
                        style: TextStyle(color: Colors.white),
                      )),
                      Tab(
                          child: Text(
                            '학생 관리',
                            style: TextStyle(color: Colors.white),
                          ))
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TabBarView(
                            children: [MyCourseList(), CreateNewCourse(),ToManageStudent()]),
                      ),
                    )
                  ],
                ))));
  }
}

class CreateNewCourse extends StatelessWidget {
  const CreateNewCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ManageCourseController manageCourseController =
        Get.find<ManageCourseController>();

    return Column(
      children: [
        TextField(
          controller: manageCourseController.courseNameController,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10),
              fillColor: Colors.white,
              filled: true,
              hintText: '강의 제목',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10))),
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          color: Color.fromRGBO(45, 40, 46, 1),
          onPressed: () {
            manageCourseController.enrollNewCourse();
          },
          child: Container(
            width: double.infinity,
            child: Center(
              child: Text(
                '강의 개설',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class MyCourseList extends StatelessWidget {
  const MyCourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ManageCourseController manageCourseController =
        Get.find<ManageCourseController>();
    return GetBuilder<ManageCourseController>(builder: (_) {
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
                      manageCourseController.tocreateArticleScreen(manageCourseController.courseList[index].id);
                    },
                    child: Text(
                      manageCourseController.courseList[index].name,
                      style: TextStyle(color: Colors.white),
                    )));
          },
          itemCount: manageCourseController.courseList.length);
    });
  }
}

class ToManageStudent extends StatelessWidget {
  const ToManageStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ManageCourseController manageCourseController =
    Get.find<ManageCourseController>();
    return GetBuilder<ManageCourseController>(builder: (_) {
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
                      manageCourseController.toManageStudentScreen(manageCourseController.courseList[index].id);
                    },
                    child: Text(
                      manageCourseController.courseList[index].name,
                      style: TextStyle(color: Colors.white),
                    )));
          },
          itemCount: manageCourseController.courseList.length);
    });
  }
}
