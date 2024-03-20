import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/domain/entities/article.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/pages/detail/news_detail_screen.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/pages/detail/saved_articles.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/pages/home/news_home_screen.dart';

class RouteConfigeration {
  BuildContext context;
  RouteConfigeration(this.context);

  /// The route configuration.
  GoRouter _router() {
    return GoRouter(
      // errorBuilder: (context, state) => ErrorPage(state.error),
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const NewsHomeScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'details',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return CustomTransitionPage<void>(
                  key: state.pageKey,
                  child: NewsDetailScreen(
                    extra: state.extra as ArticleEntity,
                  ),
                  transitionDuration: const Duration(milliseconds: 150),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    // Change the opacity of the screen using a Curve based on the the animation's
                    // value
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOut)
                          .animate(animation),
                      child: child,
                    );
                  },
                );
              },
            ),
            GoRoute(
              path: 'saved',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return CustomTransitionPage<void>(
                  key: state.pageKey,
                  child: const SavedArticlesPage(
                      // extra: state.extra as ArticleEntity,
                      ),
                  transitionDuration: const Duration(milliseconds: 150),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    // Change the opacity of the screen using a Curve based on the the animation's
                    // value
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOut)
                          .animate(animation),
                      child: child,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  GoRouter get route => _router();
}




/*

      GoRoute(
              path: 'details/:article',
              builder: (BuildContext context, GoRouterState state) {
                // int index = int.parse(state.pathParameters['index']!);
                var ar = state.pathParameters['article'] as ArticleEntity;
                return NewsDetailScreen(
                  article: ar,
                );
              },
            ),

*/