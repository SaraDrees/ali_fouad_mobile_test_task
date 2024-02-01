import 'dart:developer';

import 'package:dio/dio.dart';

import 'dio_controller.dart';

class RequestInterceptor extends Interceptor {
  DioController dioController;
  RequestInterceptor({required this.dioController});
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log("Hi RequestInterceptor");
    options.headers["Access-Control-Allow-Origin"] = '*';
    options.headers['Access-Control-Allow-Credentials'] = true;
    options.headers['Access-Control-Allow-Headers'] =
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
    options.headers['Access-Control-Allow-Methods'] = '*'; 
     final value =  dioController.checkToken(options.uri.path);
      if (value != '') {
        options.headers['Authorization'] = 'Bearer $value';
      }
    log(
      '----------------------------------------------"\n#Start Request#\n@path:${options.uri}\n@headers:${options.headers}\n@data:${options.data}\n@queryParameters:${options.queryParameters}\n#End Request#\n"----------------------------------------------',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      '----------------------------------------------"\n#Start Response#\n@path:${response.requestOptions.path}\n@statusCode:${response.statusCode}\n@data:${response.data}\n#End Response#\n"----------------------------------------------',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      log(
        '----------------------------------------------"\n#Start Error#\n@path:${err.requestOptions.path}\n@message:${err.response!.data}\n@code:${err.response!.statusCode}\n@type:${err.type}\n#End Error#\n"----------------------------------------------',
      );
    } else {
      log(
        '----------------------------------------------"\n#Start Error#\n@path:${err.requestOptions.path}\n@message:${err.message}\n@code:UnKnown\n@type:${err.type}\n#End Error#\n"----------------------------------------------',
      );
    }
    super.onError(err, handler);
  }
 
 



}
