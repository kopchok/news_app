import 'package:hive/hive.dart';
import 'package:news/core/api/dio_service.dart';
import 'package:news/core/hive/box/news/news.dart';
import 'package:news/core/hive/box/news_image/news_image.dart';
import 'package:uuid/uuid.dart';

class NewsRepository {
  final _dio = DioService().clientService;
  final _newsBox = Hive.box<News>('newsBox');

  Future<void> getNews({String? type}) async {
    try {
      final response = await _dio.get(
        "/${type ?? 'latest'}",
        queryParameters: {
          'lr': 'en-US',
        },
      );
      if (response.statusCode == 200) {
        final data = response.data['items'];
        const uuid = Uuid();

        for (var item in data) {
          final news = News(
            id: uuid.v4(),
            title: item['title'],
            snippet: item['snippet'],
            publisher: item['publisher'],
            timestamp: item['timestamp'],
            newsUrl: item['newsUrl'],
            images: NewsImage(
              thumbnail: item?['images']?['thumbnail'],
              thumbnailProxied: item?['images']?['thumbnailProxied'],
            ),
            category: type ?? '',
            isFavorite: false,
          );
          await _newsBox.put(news.id, news);
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
