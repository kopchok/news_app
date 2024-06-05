import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/core/hive/box/news/news.dart';
import 'package:news/core/hive/box/news_image/news_image.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();
  HiveService._internal();
  factory HiveService() {
    return _instance;
  }

  Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter(NewsAdapter());
    Hive.registerAdapter(NewsImageAdapter());

    await Hive.openBox<News>('newsBox');
  }
}
