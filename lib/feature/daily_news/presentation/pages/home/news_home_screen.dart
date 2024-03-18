import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_imp_clean_architecture_bloc/core/resources/consts.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/entities/article.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/remote/bloc/remote_article_state.dart';

class NewsHomeScreen extends StatelessWidget {
  const NewsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Headlines"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[200],
      ),
      body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (context, state) {
          RemoteArticleState s = state;
          if (s is RemoteArticleLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (s is RemoteArticleError) {
            return const Center(child: Text("some thing went wrong !"));
          } else if (s is RemoteArticleDone) {
            return ListView.builder(
              itemCount: s.article!.length,
              itemBuilder: (context, index) {
                // List<ArticleEntity>? sArticle = s.article;
                // var articleList = s.article![index];
                return NewsArtileTiles(article: s.article![index]);
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

class NewsArtileTiles extends StatelessWidget {
  const NewsArtileTiles({super.key, required this.article});
  final ArticleEntity? article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: CachedNetworkImage(imageUrl: article!.urlToImage ?? defaultImg),
    );
  }
}
