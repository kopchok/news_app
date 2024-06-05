import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/feature/news/cubit/new_detail/news_detail_cubit.dart';
import 'package:news/feature/news/routes/news_arg.dart';
import 'package:news/feature/news/screen/news_detail_screen.dart';
import 'package:news/feature/news/screen/news_screen.dart';

Map<String, Widget Function(BuildContext)> newsRoute = {
  "/news": (context) {
    return const NewsScreen();
  },
  "/news-detail": (context) {
    final args = ModalRoute.of(context)?.settings.arguments as NewsDetailArg?;
    return BlocProvider(
      lazy: false,
      create: (context) => NewsDetailCubit()..initNews(args?.news),
      child: const NewsDetailScreen(),
    );
  },
};
