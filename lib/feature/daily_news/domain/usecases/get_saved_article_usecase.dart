import 'package:news_app_imp_clean_architecture_bloc/core/usecases/usecase.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/entities/article.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/repositories/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;
  const GetSavedArticleUseCase(this._articleRepository);
  @override
  Future<List<ArticleEntity>> call(params) {
    return _articleRepository.getSavedArticles();
  }
}
