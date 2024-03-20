import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/data/data_sources/DAO/app_db.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/data/repositories_imp/article_repository_imp.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/repositories/article_repository.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/usecases/get_article.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/usecases/get_saved_article_usecase.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/usecases/remove_article_usecase.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/usecases/saved_artcle_usecase.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/article/bloc/local_article_bloc.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final db = await $FloorAppDb.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDb>(db);
  // dio
  sl.registerSingleton<Dio>(Dio());
  // dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImp(sl(), sl()));
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<SavedArticleUseCase>(SavedArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
  sl.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(sl(), sl(), sl()));
}
