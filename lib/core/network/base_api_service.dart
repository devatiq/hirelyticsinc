import 'dart:convert';

import 'package:dio/dio.dart';

import '../error/data_state.dart';
import '../error/exception_handler.dart';
import '../utils/constants/api_constants.dart';
import 'interceptor/logger_interceptor.dart';

class BaseApiService {
  final _option = BaseOptions(
    baseUrl: ApiConstants.apiBaseUrlWithHttps,
    headers: {'Content-Type': 'application/json'},
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 40),
    sendTimeout: const Duration(seconds: 30),
    responseType: ResponseType.json,
    followRedirects: false,
  );

  Dio get dio => Dio(_option)
    ..interceptors.addAll([
      LoggerInterceptor(),
    ]);

  Options optionGenerator(String token) {
    return Options(headers: {'Authorization': 'Bearer $token'});
  }

  Map getMap(dynamic data) {
    if (data == null) return {};
    return (data is Map) ? data : jsonDecode(data);
  }

  Failure getLeft(Object e) {
    if (e is DioException) {
      return ServerFailure(ExceptionHandler.getDioError(e).msg);
    }
    return ServerFailure(e.toString());
  }
}
