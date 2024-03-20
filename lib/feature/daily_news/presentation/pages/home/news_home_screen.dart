import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/entities/article.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/remote/bloc/remote_article_state.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/widgets/news_article_tiles.dart';

class NewsHomeScreen extends StatelessWidget {
  const NewsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Headlines"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white70,
        actions: [
          InkWell(
            onTap: () {
              if (kDebugMode) {
                print("added to bookmark");
              }
            },
            child: Padding(
              padding: EdgeInsets.only(right: 6.w),
              child: InkWell(
                onTap: () => context.push('/saved'),
                child: Icon(
                  Icons.bookmark,
                  color: Colors.orange[400],
                ),
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (context, state) {
          RemoteArticleState s = state;
          if (s is RemoteArticleLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (s is RemoteArticleError) {
            return Center(
                child: Text(
              "some thing went wrong ! \n ${s.error!} ",
              textAlign: TextAlign.center,
            ));
          } else if (s is RemoteArticleDone) {
            return ListView.builder(
              itemCount: s.article!.length,
              itemBuilder: (context, index) {
                // List<ArticleEntity>? sArticle = s.article;
                ArticleEntity article = s.article![index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: InkWell(
                    onTap: () => context.push('/details', extra: article),
                    child: NewsArtileTiles(
                        image: article.urlToImage,
                        title: article.title,
                        date: article.publishedAt),
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
