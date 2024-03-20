import 'package:news_app_imp_clean_architecture_bloc/core/usecases/usecase.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/entities/article.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/repositories/article_repository.dart';

class SavedArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;
  const SavedArticleUseCase(this._articleRepository);
  @override
  Future<void> call(ArticleEntity? params) {
    return _articleRepository.saveArticles(params!);
  }
}
