import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
              child: Icon(
                Icons.bookmark_outline,
                color: Colors.grey[400],
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
                // var articleList = s.article![index];
                return NewsArtileTiles(article: s.article![index]);
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/details');
        },
        child: const Icon(Icons.navigate_next),
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
      child: InkWell(
        onTap: () {
          print("hi");
        },
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150.h,
              width: 110.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: CachedNetworkImage(
                  imageUrl: article!.urlToImage ?? defaultImg,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Image.network(
                    defaultImg,
                    fit: BoxFit.cover,
                  ),
                  fit: BoxFit.fitHeight,
                  // height: 100,
                  // width: 100,
                ),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Container(
              width: 220.w,
              height: 150.h,
              // padding: EdgeInsets.symmetric(ho,vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[100],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                    child: Text(
                      article!.title ?? "title",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )),
                  Divider(
                    thickness: 0.5.w,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.date_range),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          article!.publishedAt!,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

extension ScreenSize on num {
  SizedBox get wth => SizedBox(
        width: toDouble().w,
      );
  SizedBox get hth => SizedBox(
        height: toDouble().h,
      );
}
