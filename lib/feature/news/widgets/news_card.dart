import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:news/core/hive/box/news/news.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, this.news, this.onTap, this.onFavorite});

  final News? news;
  final Function()? onTap;
  final Function()? onFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  news?.images?.thumbnail ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => SizedBox(
                    height: 100,
                    child: Center(
                      child: Icon(
                        Icons.warning,
                        color: Colors.red.shade400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        news?.title ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    GestureDetector(
                      onTap: onFavorite,
                      child: SizedBox(
                        child: news?.isFavorite ?? false
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.pink,
                              )
                            : const Icon(Icons.favorite_border),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    DateTime.fromMillisecondsSinceEpoch(
                            (int.tryParse(news?.timestamp ?? '')) ?? 0 * 1000)
                        .format(AmericanDateFormats.dayOfWeek),
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  news?.snippet ?? '',
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
