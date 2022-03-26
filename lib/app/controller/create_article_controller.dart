import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kweb/app/data/model/models.dart';
import 'package:kweb/app/data/repository/create_article_repository.dart';
import 'package:zefyrka/zefyrka.dart';

import '../../constants.dart';

class CreateArticleController extends GetxController {
  final CreateArticleRepository repository;

  CreateArticleController({required this.repository})
      : assert(repository != null);

  @override
  void onInit() async {
    super.onInit();
    await initialize();
  }

  Future<bool> initialize() async {
    userId = Get.arguments[FirestoreConstants.id];
    courseId = Get.arguments[FirestoreConstants.course];
    return true;
  }

  late String userId;
  late String courseId;
  ZefyrController zcontroller = ZefyrController();
  TextEditingController titleController = TextEditingController();

  void saveDocument() {
    if (zcontroller.document.length>1 && titleController.text.isNotEmpty) {
      final String contents = jsonEncode(zcontroller.document);
      ArticleModel articleModel = ArticleModel(
          course: courseId,
          name: titleController.text,
          body: contents,
          timestamp: Timestamp.now(),
          id: (courseId + userId + titleController.text).hashCode.toString());
      repository.AddNewArticle(articleModel);
      Get.back();
    }
  }
}
