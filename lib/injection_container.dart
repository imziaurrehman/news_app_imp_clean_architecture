import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/data/repositories_imp/article_repository_imp.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/repositories/article_repository.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/usecases/get_article.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // dio
  sl.registerSingleton<Dio>(Dio());
  // dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImp(sl()));
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
