import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_imp_clean_architecture_bloc/config/theme/text_theme.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/entities/article.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/remote/bloc/remote_article_state.dart';

class NewsDetailScreen extends StatelessWidget {
  final ArticleEntity extra;
  const NewsDetailScreen({
    super.key,
    required this.extra,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News Detail"),
          elevation: 0.0,
          centerTitle: true,
          // backgroundColor: Colors.grey[100],
        ),
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            NewsTitle(
              // pass list
              articles: extra,
            ),
            // NewsImageContainer(),
            // NewsDescription(),
          ],
        ));
  }
}

class NewsTitle extends StatelessWidget {
  final ArticleEntity articles;
  const NewsTitle({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        articles.title!,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

class NewsImageContainer extends StatelessWidget {
  const NewsImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class NewsDescription extends StatelessWidget {
  const NewsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
