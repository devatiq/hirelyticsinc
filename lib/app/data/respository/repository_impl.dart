import 'package:fpdart/src/either.dart';
import 'package:hirelyticsinc/app/data/model/blog_remote_post_model.dart';
import 'package:hirelyticsinc/app/data/model/blog_remote_response_model.dart';
import 'package:hirelyticsinc/app/data/model/submit_form_remote_post_model.dart';
import 'package:hirelyticsinc/app/data/model/submit_form_remote_response_model.dart';
import 'package:hirelyticsinc/app/domain/repository/repository.dart';
import 'package:hirelyticsinc/core/error/data_state.dart';

class RepositoryImpl extends Repository {
  const RepositoryImpl({required super.remoteService});

  @override
  Future<Either<Failure, List<BlogRemoteResponseModel>>> getBlogsRemote(
      BlogRemotePostModel model) async {
    return await remoteService.getBlogs(model);
  }

  @override
  Future<Either<Failure, SubmitFormRemoteResponseModel>> submitForm(
      SubmitFormRemotePostModel model) async {
    return await remoteService.submitForm(model);
  }
}
