import 'package:kweb/app/data/providers/create_article_provider.dart';

import '../model/models.dart';

class CreateArticleRepository {
  final CreateArticleProvider createArticleProvider;

  CreateArticleRepository({required this.createArticleProvider})
      : assert(createArticleProvider != null);

  Future<bool> AddNewArticle(ArticleModel article) => createArticleProvider.addNewArticle(article);
}
