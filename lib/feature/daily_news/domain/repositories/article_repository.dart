import 'package:news_app_imp_clean_architecture_bloc/core/resources/data_state.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticle();

  //get
  Future<List<ArticleEntity>> getSavedArticles();
  //save
  Future<void> saveArticles(ArticleEntity articleEntity);
  //remove
  Future<void> removeSavedArticles(ArticleEntity articleEntity);
}
