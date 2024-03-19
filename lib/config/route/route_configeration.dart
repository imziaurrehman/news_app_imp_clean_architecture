import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/pages/detail/news_detail_screen.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/pages/home/news_home_screen.dart';

class RouteConfigeration {
  BuildContext context;
  RouteConfigeration(this.context);

  /// The route configuration.
  GoRouter _router() {
    return GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const NewsHomeScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'details',
              builder: (BuildContext context, GoRouterState state) {
                return const NewsDetailScreen();
              },
            ),
          ],
        ),
      ],
    );
  }

  GoRouter get route => _router();
}
