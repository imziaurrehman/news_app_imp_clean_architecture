import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_imp_clean_architecture_bloc/config/theme/text_theme.dart';
import 'package:news_app_imp_clean_architecture_bloc/core/resources/consts.dart';
import 'package:news_app_imp_clean_architecture_bloc/core/utils/extensions.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/entities/article.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/article/bloc/local_article_bloc.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/remote/bloc/remote_article_state.dart';
import 'package:news_app_imp_clean_architecture_bloc/injection_container.dart';

class NewsDetailScreen extends StatelessWidget {
  final ArticleEntity extra;
  const NewsDetailScreen({
    super.key,
    required this.extra,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "News Detail",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          elevation: 0.0,
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: const Icon(
                Icons.share,
              ),
            )
          ],
          backgroundColor: Colors.white,
        ),
        // page bg color
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // news image
            12.ph,
            NewsImageContainer(
              articles: extra,
            ),
            15.ph,
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r))),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.ph,
                    CustomBadge(articles: extra),
                    4.ph,
                    divider,
                    1.ph,
                    // news title
                    NewsTitle(
                      // pass list
                      articles: extra,
                    ),
                    12.ph,
                    // show date time
                    ShowDateTime(articles: extra),
                    10.ph,
                    // news description
                    NewsDescription(
                      articles: extra,
                    ),
                  ],
                ),
              ),
            ),
            // 6.ph,
          ],
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        // floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

// news title cls
class NewsTitle extends StatelessWidget {
  final ArticleEntity? articles;
  const NewsTitle({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPW,
      child: Text(
        articles!.title ?? "title",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

// news image cls
class NewsImageContainer extends StatelessWidget {
  final ArticleEntity? articles;

  const NewsImageContainer({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      padding: defaultPW,
      child: SizedBox(
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: SizedBox(
            child: CachedNetworkImage(
              imageUrl: articles!.urlToImage ?? defaultImg,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
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
      ),
    );
  }
}

// new description class
class NewsDescription extends StatelessWidget {
  final ArticleEntity? articles;

  const NewsDescription({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: defaultPW,
        child: Text(
          articles!.description ?? "description",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

// date time class
class ShowDateTime extends StatelessWidget {
  final ArticleEntity? articles;
  const ShowDateTime({super.key, required this.articles});
  @override
  Widget build(BuildContext context) {
    // var datetime = DateTime.now();

    return Padding(
      padding: defaultPW,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(2),
        child: Text(
          articles!.publishedAt ?? "10/03/2024 at 12:30:05 PM",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}

class CustomBadge extends StatelessWidget {
  final ArticleEntity? articles;
  const CustomBadge({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPW,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120.w,
            height: 35.h,
            padding:
                EdgeInsets.only(left: 10.w, bottom: 5.h, top: 1.h, right: 2.w),
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
            child: Text(
              articles!.author ?? "author",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: GestureDetector(
                onTap: () {
                  // context.read<LocalArticleBloc>().add(SavedArticle(articles!));
                  var sr = SaveArticleEvent(articles!);
                  BlocProvider.of<LocalArticleBloc>(context).add(sr);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("ARTICLE IS SAVED TO BOOKMARK !")));
                  print("$sr");
                },
                child: const Icon(Icons.bookmark_add)),
          ),
        ],
      ),
    );
  }
}
