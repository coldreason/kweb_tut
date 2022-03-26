import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kweb/app/data/model/models.dart';
import 'package:zefyrka/zefyrka.dart';

import '../../constants.dart';

class ViewArticleController extends GetxController {

  @override
  void onInit() async {
    super.onInit();
    await initialize();
  }

  ArticleModel articleModel = ArticleModel(course: '', name: '', body: '', timestamp: Timestamp.now(), id: '');
  var data = '';

  Future<bool> initialize() async {
    articleModel = Get.arguments[FirestoreConstants.article];
    data = jsonDecode(articleModel.body).toString();
    update();
    return true;
  }
}
