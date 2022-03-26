import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kweb/app/controller/manage_course_controller.dart';

import '../../../controller/manage_student_controller.dart';

class ManageStudentScreen extends StatelessWidget {
  const ManageStudentScreen({Key? key}) : super(key: key);

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
                    child: Text(
                        '학생목록 : 클릭시 수강취소됩니다.',
                        style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StudentList(),
                  ),
                )
              ],
            )));
  }
}

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ManageStudentController manageStudentController =
    Get.find<ManageStudentController>();
    return GetBuilder<ManageStudentController>(builder: (_) {
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
                      manageStudentController.deleteStudent(manageStudentController.studentModelList[index].id);
                    },
                    child: Text(
                      manageStudentController.studentModelList[index].id,
                      style: TextStyle(color: Colors.white),
                    )));
          },
          itemCount: manageStudentController.studentModelList.length);
    });
  }
}
