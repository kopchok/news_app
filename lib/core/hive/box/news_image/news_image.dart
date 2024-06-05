// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'news_image.g.dart';

@HiveType(typeId: 1)
class NewsImage extends HiveObject {
  @HiveField(0)
  final String? thumbnail;

  @HiveField(1)
  final String? thumbnailProxied;

  NewsImage({
    this.thumbnail,
    this.thumbnailProxied,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thumbnail': thumbnail,
      'thumbnailProxied': thumbnailProxied,
    };
  }

  String toJson() => json.encode(toMap());
}
