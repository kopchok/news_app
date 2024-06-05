// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'news_detail_cubit.dart';

class NewsDetailState extends Equatable {
  final News? news;
  final WebViewController? controller;

  const NewsDetailState({
    this.news,
    this.controller,
  });
  @override
  List<Object?> get props => [news, controller];

  NewsDetailState copyWith({
    News? news,
    WebViewController? controller,
  }) {
    return NewsDetailState(
      news: news ?? this.news,
      controller: controller ?? this.controller,
    );
  }
}
