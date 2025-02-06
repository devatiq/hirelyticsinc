import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hirelyticsinc/app/data/model/blog_remote_response_model.dart';
import 'package:hirelyticsinc/core/network/base_api_service.dart';

import '../../../core/error/data_state.dart';
import '../../../core/utils/constants/api_constants.dart';
import '../model/blog_remote_post_model.dart';

abstract class IRemoteService {
  final BaseApiService apiService;

  const IRemoteService(this.apiService);

  Future<Either<Failure, List<BlogRemoteResponseModel>>> getBlogs(
      BlogRemotePostModel model);
}

class RemoteService extends IRemoteService {
  const RemoteService(super.apiService);

  @override
  Future<Either<Failure, List<BlogRemoteResponseModel>>> getBlogs(
      BlogRemotePostModel model) async {
    try {
      final response = await apiService.dio.get(ApiConstants.blogEndPoint,
          data: FormData.fromMap(model.toMap()));

      if (response.statusCode == 200) {
        final responseData = response.data as List?;
        print(responseData.runtimeType);
        if (responseData != null) {
          final modelList = responseData.map((e) {
            print(e.runtimeType);
            return BlogRemoteResponseModel.fromJson(apiService.getMap(e));
          }).toList();

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
}
