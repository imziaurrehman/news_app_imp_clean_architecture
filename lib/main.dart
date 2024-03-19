import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get_it/get_it.dart';
import 'package:news_app_imp_clean_architecture_bloc/config/route/route_configeration.dart';
import 'package:news_app_imp_clean_architecture_bloc/config/theme/text_theme.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/article/bloc/local_article_bloc.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/presentation/bloc/remote/bloc/remote_article_event.dart';
import 'package:news_app_imp_clean_architecture_bloc/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    RouteConfigeration _router = RouteConfigeration(context);
    return BlocProvider<RemoteArticleBloc>(
      create: (BuildContext context) => sl()..add(const GetArticlesEvent()),
      //  BlocProvider.of<RemoteArticleBloc>(context)
      // ..add(const GetArticlesEvent()),
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp.router(
              title: 'News App imp Clean Architecture',
              theme: theme,
              debugShowCheckedModeBanner: false,
              routerConfig: _router.route,
            );
          }),
    );
  }
}
