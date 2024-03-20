import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/entities/article.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/usecases/get_saved_article_usecase.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/usecases/remove_article_usecase.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/usecases/saved_artcle_usecase.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/article/bloc/local_article_event.dart';

part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final SavedArticleUseCase _savedArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  LocalArticleBloc(this._savedArticleUseCase, this._getSavedArticleUseCase,
      this._removeArticleUseCase)
      : super(const LocalArticleLoading()) {
    on<GetSavedArticleEvent>(onGetSavedArticles);
    on<SaveArticleEvent>(onSavedArticles);
    on<RemoveSavedArticleEvent>(onRemoveArticles);
  }
  void onGetSavedArticles(GetSavedArticleEvent getSavedArticle,
      Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase.call(null);
    emit(LocalArticleDone(articles));
  }

  void onSavedArticles(
      SaveArticleEvent savedArticle, Emitter<LocalArticleState> emit) async {
    await _savedArticleUseCase(savedArticle.articleEntity);
    final articles = await _getSavedArticleUseCase(null);
    emit(LocalArticleDone(articles));
  }

  void onRemoveArticles(RemoveSavedArticleEvent removeSavedArticle,
      Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(removeSavedArticle.articleEntity);
    final articles = await _getSavedArticleUseCase(null);
    // if (kDebugMode) {
    //   print(articles);
    // }
    emit(LocalArticleDone(articles));
  }
}
