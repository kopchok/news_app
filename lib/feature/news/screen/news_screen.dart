import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/bloc/news/news_cubit.dart';
import 'package:news/core/enum/network_status.dart';
import 'package:news/feature/news/widgets/category_news.dart';
import 'package:news/feature/news/widgets/list_news.dart';
import 'package:news/feature/news/widgets/refresh_news.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:toastification/toastification.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isError) {
          toastification.show(
            alignment: Alignment.topCenter,
            title: Flexible(
              child: Text(
                state.message,
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
            ),
            autoCloseDuration: const Duration(seconds: 5),
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        final bloc = context.read<NewsCubit>();
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              state.pageIndex == 0 ? 'News' : 'Favorite',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: state.pageIndex == 0
              ? Column(
                  children: [
                    CategoryNews(
                      onTap: (type) => bloc.selectCategory(type: type),
                    ),
                    state.status.isError
                        ? ErrorNews(
                            onRefresh: () => bloc.selectCategory(),
                          )
                        : ListNews(
                            list: state.news,
                            status: state.status,
                            onRefresh: () async => bloc.fetchNews(isRefresh: true),
                            onFavorite: (v) => bloc.favoriteNews(v),
                          )
                  ],
                )
              : ListNews(
                  list: state.favorites,
                  status: state.status,
                  onRefresh: () async {},
                  onFavorite: (v) => bloc.favoriteNews(v),
                ),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: state.pageIndex,
            onTap: (i) => bloc.changePage(i),
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: const Icon(Icons.newspaper),
                title: const Text("News"),
                selectedColor: Colors.purple,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: const Icon(Icons.favorite_border),
                title: const Text("Likes"),
                selectedColor: Colors.pink,
              ),
            ],
          ),
        );
      },
    );
  }
}
