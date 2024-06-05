import 'package:flutter/material.dart';
import 'package:news/core/enum/network_status.dart';
import 'package:news/core/hive/box/news/news.dart';
import 'package:news/feature/news/routes/news_arg.dart';
import 'package:news/feature/news/widgets/loading_card.dart';
import 'package:news/feature/news/widgets/news_card.dart';
import 'package:news/main.dart';

class ListNews extends StatelessWidget {
  const ListNews({
    super.key,
    required this.list,
    required this.status,
    required this.onRefresh,
    this.onFavorite,
  });

  final List<News?> list;
  final NetworkStatus status;
  final Future<void> Function() onRefresh;
  final void Function(News?)? onFavorite;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.separated(
            itemCount: list.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final news = list[index];

              if (status.isLoading) {
                return const LoadingCard();
              } else {
                return NewsCard(
                  news: news,
                  onTap: () => navigatorKey.currentState?.pushNamed(
                    '/news-detail',
                    arguments: NewsDetailArg(news: news),
                  ),
                  onFavorite: () {
                    onFavorite?.call(news);
                  },
                );
              }
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          ),
        ),
      ),
    );
  }
}
