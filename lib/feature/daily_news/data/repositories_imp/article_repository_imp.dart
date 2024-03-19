import 'dart:io';

import 'package:news_app_imp_clean_architecture_bloc/core/resources/consts.dart';
import 'package:news_app_imp_clean_architecture_bloc/core/resources/data_state.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/data/data_sources/DAO/app_db.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/data/models/article_model.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/entities/article.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/repositories/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImp extends ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDb _appDb;
  ArticleRepositoryImp(this._newsApiService, this._appDb);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResp = await _newsApiService.getNewsArticles(
        apiKey: apiKey,
        country: country,
        category: category,
      );
      if (httpResp.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResp.data);
      } else {
        return DataFailed(DioException(
            requestOptions: httpResp.response.requestOptions,
            error: httpResp.response.statusMessage,
            response: httpResp.response,
            type: DioExceptionType.badResponse));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleEntity>> getSavedArticles() {
    return _appDb.articleDao.getArticle();
  }

  @override
  Future<void> removeSavedArticles(ArticleEntity articleEntity) {
    return _appDb.articleDao.delArticle(ArticleModel.fromEntity(articleEntity));
  }

  @override
  Future<void> saveArticles(ArticleEntity articleEntity) {
    return _appDb.articleDao
        .insertArticle(ArticleModel.fromEntity(articleEntity));
  }
}
