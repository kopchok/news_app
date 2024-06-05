import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/feature/news/cubit/new_detail/news_detail_cubit.dart';
import 'package:news/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsDetailCubit, NewsDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.news?.title ?? '',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          body: WebViewWidget(
            controller: state.controller!
              ..setNavigationDelegate(
                NavigationDelegate(
                  onPageStarted: (_) => showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  onPageFinished: (_) => navigatorKey.currentState?.pop(),
                ),
              ),
          ),
        );
      },
    );
  }
}
