part of 'local_article_bloc.dart';

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
