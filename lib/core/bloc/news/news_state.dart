// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'news_cubit.dart';

class NewsState extends Equatable {
  final NetworkStatus status;
  final TypeNews type;
  final List<News?> news;
  final List<News?> favorites;
  final int pageIndex;
  final String message;

  const NewsState({
    this.status = NetworkStatus.init,
    this.type = TypeNews.latest,
    this.news = const [],
    this.favorites = const [],
    this.pageIndex = 0,
    this.message = '',
  });

  @override
  List<Object?> get props => [status, type, news, message, favorites, pageIndex];

  NewsState copyWith({
    NetworkStatus? status,
    TypeNews? type,
    List<News?>? news,
    List<News?>? favorites,
    int? pageIndex,
    String? message,
  }) {
    return NewsState(
      status: status ?? this.status,
      type: type ?? this.type,
      news: news ?? this.news,
      favorites: favorites ?? this.favorites,
      pageIndex: pageIndex ?? this.pageIndex,
      message: message ?? this.message,
    );
  }
}
