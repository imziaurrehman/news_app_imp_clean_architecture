import 'package:dio/dio.dart';
import 'package:news_app_imp_clean_architecture_bloc/core/resources/consts.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/data/models/article_model.dart';
import 'package:retrofit/retrofit.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
