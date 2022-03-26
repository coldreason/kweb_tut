import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:kweb/app/controller/view_article_controller.dart';

class ViewArticleScreen extends StatelessWidget {
  const ViewArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ViewArticleController viewArticleController =
    Get.find<ViewArticleController>();
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(123, 3, 19, 1),
            body: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                          child: Center(
                            child: Text(viewArticleController.articleModel.name,
                                style: TextStyle(color: Colors.white)),
                          )),
                      Expanded(
                        flex: 1,
                          child: Center(
                            child: Text(viewArticleController.articleModel.timestamp.toDate().toString(),
                                style: TextStyle(color: Colors.white)),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(child: Markdown(data: viewArticleController.data))
              ],
            )));
  }
}