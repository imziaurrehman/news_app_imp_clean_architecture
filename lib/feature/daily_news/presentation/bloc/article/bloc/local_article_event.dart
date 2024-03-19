part of 'local_article_bloc.dart';

abstract class LocalArticleEvent extends Equatable {
  ArticleEntity? articleEntity;
  LocalArticleEvent({this.articleEntity});

  @override
  List<Object> get props => [articleEntity!];
}

class GetSavedArticle extends LocalArticleEvent {
  GetSavedArticle();
}

class SavedArticle extends LocalArticleEvent {
  SavedArticle(ArticleEntity articleEntity)
      : super(articleEntity: articleEntity);
}

class RemoveSavedArticle extends LocalArticleEvent {
  RemoveSavedArticle(ArticleEntity articleEntity)
      : super(articleEntity: articleEntity);
}
