import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/article/bloc/local_article_bloc.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/widgets/news_article_tiles.dart';
import 'package:news_app_imp_clean_architecture_bloc/injection_container.dart';

class SavedArticlesPage extends HookWidget {
  const SavedArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>()..add(GetSavedArticleEvent()),
      // lazy: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Saved Artcles"),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<LocalArticleBloc, LocalArticleState>(
          builder: (context, state) {
            LocalArticleState s = state;
            if (s is LocalArticleLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (s is LocalArticleDone) {
              return ListView.builder(
                itemCount: s.articles!.length,
                itemBuilder: (context, index) {
                  // List<ArticleEntity>? sArticle = s.article;
                  var article = s.articles![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: NewsArtileTiles(
                        image: article.urlToImage,
                        title: article.title,
                        date: article.publishedAt),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
