import 'package:kweb/app/data/providers/check_article_provider.dart';

import '../model/models.dart';

class CheckArticleRepository {
  final CheckArticleProvider checkArticleProvider;

  CheckArticleRepository({required this.checkArticleProvider})
      : assert(checkArticleProvider != null);


  List<ArticleModel> _articleList = [];
  late CourseModel _courseModel;


  get courseModel => this._courseModel;
  get articleList => this._articleList;

  Future<bool> update(String id) async {
    _courseModel = await checkArticleProvider.getCourse(id);
    _articleList = await checkArticleProvider.getCourseAriticle(_courseModel);
    return true;
  }
}
