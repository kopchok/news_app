import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news/core/api/collection/news/news.dart';
import 'package:news/core/enum/network_status.dart';
import 'package:news/core/enum/type_news.dart';
import 'package:news/core/hive/box/news/news.dart';
import 'package:toastification/toastification.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(const NewsState());

  final newsBox = Hive.box<News>('newsBox');

  Future<void> fetchNews({bool isRefresh = false}) async {
    emit(state.copyWith(status: NetworkStatus.loading));
    try {
      List<News> newss = newsBox.values.where((e) => e.category.contains(state.type.name)).toList();

      if (isRefresh) {
        for (var e in newss) {
          await newsBox.delete(e.id);
        }
        newss = [];
      }

      if (newss.isEmpty) {
        await NewsRepository().getNews(type: state.type.name);
        newss = newsBox.values.where((e) => e.category.contains(state.type.name)).toList();
      }

      List<News> favorites = newsBox.values.where((e) => e.isFavorite == true).toList();

      emit(state.copyWith(news: newss, favorites: favorites, status: NetworkStatus.success));
    } on DioException catch (e) {
      emit(state.copyWith(status: NetworkStatus.error, message: e.message));
    }
  }

  Future<void> selectCategory({TypeNews? type}) async {
    emit(state.copyWith(type: type));
    await fetchNews();
  }

  void changePage(int index) {
    emit(state.copyWith(status: NetworkStatus.loading));
    emit(state.copyWith(status: NetworkStatus.success, pageIndex: index));
  }

  void favoriteNews(News? news) async {
    News find = newsBox.values.firstWhere((e) => e.id == news?.id);

    find = find.copyWith(isFavorite: !find.isFavorite);

    await newsBox.put(find.id, find);

    await fetchNews();

    if (find.isFavorite) {
      toastification.show(
        alignment: Alignment.topCenter,
        title: const Text('Added to favorites!'),
        autoCloseDuration: const Duration(seconds: 1),
        type: ToastificationType.success,
      );
    }
  }
}
