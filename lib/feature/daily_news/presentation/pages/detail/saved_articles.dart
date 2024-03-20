// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/article/bloc/local_article_bloc.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/article/bloc/local_article_event.dart';
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
          title: const Text("Saved Articles"),
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
                  if (s.articles!.isEmpty) {
                    return Center(child: Text("NO DATA FOUND HERE !"));
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        background: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.remove,
                              size: 40,
                              color: Colors.red[400],
                            ),
                          ],
                        ),
                        onDismissed: (direction) {
                          BlocProvider.of<LocalArticleBloc>(context)
                              .add(RemoveSavedArticleEvent(article));
                          // Then show a snackbar.
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Article dismissed: ${article.title}'), // Display article title
                            ),
                          );
                        },
                        confirmDismiss: (DismissDirection direction) async {
                          // Show a confirmation dialog before dismissing the item.
                          return await showCupertinoDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                title: Text("Confirm"),
                                content: Text(
                                    "Are you sure you want to delete this article?"),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    onPressed: () => Navigator.of(context).pop(
                                        false), // Dismiss the dialog without deleting
                                    child: Text("CANCEL"),
                                  ),
                                  CupertinoDialogAction(
                                    isDestructiveAction:
                                        true, // Makes the button red for iOS guidelines
                                    onPressed: () => Navigator.of(context)
                                        .pop(true), // Confirm deletion
                                    child: Text("DELETE"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: NewsArtileTiles(
                            image: article.urlToImage,
                            title: article.title,
                            date: article.publishedAt),
                      ),
                    );
                  }
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
