import 'package:equatable/equatable.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/entities/article.dart';
import 'package:dio/dio.dart';

sealed class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? article;
  final DioException? error;

  const RemoteArticleState({this.article, this.error});

  @override
  List<Object> get props => [article!, error!];
}

final class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}

final class RemoteArticleDone extends RemoteArticleState {
  const RemoteArticleDone(List<ArticleEntity> article)
      : super(article: article);
}

final class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError(DioException error) : super(error: error);
}
