// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:inshort_clone/global/global.dart';

class GetDio {
  late bool loggedIn;
  GetDio._();

  static Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          options.connectTimeout = const Duration(milliseconds: 90000);
          options.receiveTimeout = const Duration(milliseconds: 90000);
          options.sendTimeout = const Duration(milliseconds: 90000);
          options.followRedirects = true;
          options.baseUrl = "http://newsapi.org/v2/";
          options.headers["X-Api-Key"] = "${Global.apikey}";

          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioException dioError, ErrorInterceptorHandler handler) {
          if (dioError.type == DioExceptionType.unknown) {
            if (dioError.type == DioExceptionType.connectionError) {
              print("no internet");
            }
          }

          throw DioException(
              requestOptions: dioError.requestOptions, error: dioError.error);
        },
      ),
    );
    return dio;
  }
}
