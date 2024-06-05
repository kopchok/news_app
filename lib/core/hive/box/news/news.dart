// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:news/core/hive/box/news_image/news_image.dart';

part 'news.g.dart';

@HiveType(typeId: 0)
class News {
  @HiveField(0)
  final String id; // Primary key

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String snippet;

  @HiveField(3)
  final String publisher;

  @HiveField(4)
  final String timestamp;

  @HiveField(5)
  final String newsUrl;

  @HiveField(6)
  final NewsImage? images;

  @HiveField(7)
  final String category;

  @HiveField(8, defaultValue: false)
  final bool isFavorite;

  News({
    required this.id,
    required this.title,
    required this.snippet,
    required this.publisher,
    required this.timestamp,
    required this.newsUrl,
    this.images,
    required this.category,
    required this.isFavorite,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'snippet': snippet,
      'publisher': publisher,
      'timestamp': timestamp,
      'newsUrl': newsUrl,
      'images': images?.toMap(),
      'category': category,
      'isFavorite': isFavorite,
    };
  }

  String toJson() => json.encode(toMap());

  News copyWith({
    String? id,
    String? title,
    String? snippet,
    String? publisher,
    String? timestamp,
    String? newsUrl,
    NewsImage? images,
    String? category,
    bool? isFavorite,
  }) {
    return News(
      id: id ?? this.id,
      title: title ?? this.title,
      snippet: snippet ?? this.snippet,
      publisher: publisher ?? this.publisher,
      timestamp: timestamp ?? this.timestamp,
      newsUrl: newsUrl ?? this.newsUrl,
      images: images ?? this.images,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
