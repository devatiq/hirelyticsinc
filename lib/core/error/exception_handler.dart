import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

class ExceptionHandler {
  static dynamic detectException(dynamic e) {
    if (e is SocketException) {
      return const SocketException('No Internet Connection');
    }
    if (e is TimeoutException) {
      return TimeoutException('Request Timeout');
    }

    if (e is HttpException) {
      return const HttpException('Http Exception');
    }

    if (e is FormatException) {
      return const FormatException('Bad Response Format');
    }

    return const WrapperException();
  }

  static WrapperException getDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const WrapperException("Connection timed out");
      case DioExceptionType.receiveTimeout:
        return const WrapperException("Receiving timeout occurred");
      case DioExceptionType.sendTimeout:
        return const WrapperException("Request send timed out");

      case DioExceptionType.badCertificate:
        return const WrapperException("Bad SSL certificates");

      case DioExceptionType.badResponse:
        switch (error.response!.statusCode) {
          case 400:
            return const WrapperException("Bad request error");
          case 401:
            return const WrapperException("Permission denied");
          case 403:
            return const WrapperException(
                "The authenticated user is not allowed to access the specified API endpoint");
          case 404:
            return const WrapperException(
                "The requested resource does not exist");
          case 405:
            return const WrapperException(
                "Method not allowed. Please check the Allow header for the allowed HTTP methods");
          case 415:
            return const WrapperException(
                "Unsupported media type. The requested content type or version number is invalid");
          case 422:
            return const WrapperException("Data validation failed");
          case 429:
            return const WrapperException("Too many requests");
          case 500:
            return const WrapperException("Server internal error");
        }
        return const WrapperException("Oops something went wrong!");

      case DioExceptionType.cancel:
        return const WrapperException("Server canceled it");

      case DioExceptionType.connectionError:
        return const WrapperException("Connection Error");

      case DioExceptionType.unknown:
        return const WrapperException("Unknown error");
    }
  }
}

class BaseException implements Exception {
  final String? msg;

  BaseException([this.msg]);

  @override
  String toString() => msg ?? 'Unknown Error';
}

class WrapperException implements Exception {
  final String msg;

  const WrapperException([this.msg = 'Unknown Error']);

  @override
  String toString() => msg;
}

class UnknownError implements Exception {
  final String _msg;

  const UnknownError({String msg = "Unknown Error"}) : _msg = msg;

  @override
  String toString() => _msg;
}
