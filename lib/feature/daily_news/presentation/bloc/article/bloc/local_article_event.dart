// part of 'local_article_bloc.dart';

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/entities/article.dart';

abstract class LocalArticleEvent extends Equatable {
  ArticleEntity? articleEntity;
  LocalArticleEvent({this.articleEntity});

  @override
  List<Object> get props => [articleEntity!];
}

class GetSavedArticleEvent extends LocalArticleEvent {
  GetSavedArticleEvent();
}

class SaveArticleEvent extends LocalArticleEvent {
  SaveArticleEvent(ArticleEntity articleEntity)
      : super(articleEntity: articleEntity);
}

class RemoveSavedArticleEvent extends LocalArticleEvent {
  RemoveSavedArticleEvent(ArticleEntity articleEntity)
      : super(articleEntity: articleEntity);
}
