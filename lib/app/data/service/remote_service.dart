import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hirelyticsinc/app/data/model/blog_remote_response_model.dart';
import 'package:hirelyticsinc/app/data/model/submit_form_remote_post_model.dart';
import 'package:hirelyticsinc/core/network/base_api_service.dart';

import '../../../core/error/data_state.dart';
import '../../../core/utils/constants/api_constants.dart';
import '../model/blog_remote_post_model.dart';
import '../model/submit_form_remote_response_model.dart';

abstract class IRemoteService {
  final BaseApiService apiService;

  const IRemoteService(this.apiService);

  Future<Either<Failure, List<BlogRemoteResponseModel>>> getBlogs(
      BlogRemotePostModel model);

  Future<Either<Failure, SubmitFormRemoteResponseModel>> submitForm(
      SubmitFormRemotePostModel model);
}

class RemoteService extends IRemoteService {
  const RemoteService(super.apiService);

  @override
  Future<Either<Failure, List<BlogRemoteResponseModel>>> getBlogs(
      BlogRemotePostModel model) async {
    try {
      final response = await apiService.dio
          .get(ApiConstants.blogEndPoint, queryParameters: model.toMap());

      if (response.statusCode == 200) {
        final responseData = response.data as List?;
        if (responseData != null) {
          final modelList = responseData
              .map(
                  (e) => BlogRemoteResponseModel.fromJson(apiService.getMap(e)))
              .toList();

          return Right(modelList);
        }
      }

      return Left(ServerFailure(response.statusMessage ??
          response.data?.toString() ??
          'Server Failure'));
    } on Exception catch (e) {
      return Left(apiService.getLeft(e));
    }
  }

  @override
  Future<Either<Failure, SubmitFormRemoteResponseModel>> submitForm(
      SubmitFormRemotePostModel model) async {
    const String formConsumerKey = String.fromEnvironment('FORM_CONSUMER_KEY');
    const String formConsumerSecret =
        String.fromEnvironment('FORM_CONSUMER_SECRET');

    final String auth =
        base64Encode(utf8.encode('$formConsumerKey:$formConsumerSecret'));

    final headers = {
      "Authorization": "Basic $auth",
      "Content-Type": "application/json"
    };
    final options = Options(headers: headers);

    try {
      final response = await apiService.dio.post(
          ApiConstants.submitFormEndPoint,
          options: options,
          queryParameters: model.toMap());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data as List?;
        if (responseData != null) {
          final model = SubmitFormRemoteResponseModel.fromJson(
              apiService.getMap(responseData));

          return Right(model);
        }
      }

      return Left(ServerFailure(response.statusMessage ??
          response.data?.toString() ??
          'Server Failure'));
    } on Exception catch (e) {
      return Left(apiService.getLeft(e));
    }
  }
}
