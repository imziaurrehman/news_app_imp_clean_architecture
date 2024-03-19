import 'dart:async';

import 'package:floor/floor.dart';
import 'package:news_app_imp_clean_architecture_bloc/feature/daily_news/data/models/article_model.dart';
import 'article_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_db.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDb extends FloorDatabase {
  ArticleDao get articleDao;
}
