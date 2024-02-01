import 'package:ali_fouad_app/core/constant.dart';
import 'package:dio/dio.dart';

import 'dio_controller.dart';
import 'request_interceptor.dart';

class DioFactory {


  static Dio dioSetUp() {
    final BaseOptions options = BaseOptions(
      sendTimeout: Constant.sendTimeout,
      connectTimeout: Constant.connectTimeout,
      receiveTimeout: Constant.receiveTimeout,
      contentType: "application/json",
      headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }
    );
    final Dio dio = Dio(options);
    dio.interceptors.addAll([
      RequestInterceptor(
        dioController: DioController(
          dio: dio,
        ),
      ),
    ]);
    return dio;
  }
}
