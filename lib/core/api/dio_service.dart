// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:dio/dio.dart';

class DioService {
  late Dio clientService;

  static final DioService _dioService = DioService._internal();

  factory DioService() {
    return _dioService;
  }

  DioService._internal() {
    final clientDioOptions = BaseOptions(
      baseUrl: 'https://google-news13.p.rapidapi.com',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'x-rapidapi-key': '1e311a5cbbmsha48ce9e2ca0c1bfp167f92jsn599fe0192d4e',
      },
    );

    clientService = Dio(clientDioOptions);
    clientService.interceptors.add(DioInterceptors());
  }
}

class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('DIO REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('DIO RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    inspect('[DIO] DioError err');
    inspect(err);
    print('DIO ERROR[${err.error}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }
}
