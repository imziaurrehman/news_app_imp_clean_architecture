import 'package:floor/floor.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/data/models/article_model.dart';

@dao
abstract class ArticleDao {
  @insert
  Future<void> insertArticle(ArticleModel articleModel);
  @delete
  Future<void> delArticle(ArticleModel articleModel);
  @Query('SELECT ALL * FROM article')
  Future<List<ArticleModel>> getArticle();
}
