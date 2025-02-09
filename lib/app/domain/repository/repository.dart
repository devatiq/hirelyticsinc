import 'package:fpdart/fpdart.dart';
import 'package:hirelyticsinc/app/data/service/remote_service.dart';

import '../../../core/error/data_state.dart';
import '../../data/model/blog_remote_post_model.dart';
import '../../data/model/blog_remote_response_model.dart';
import '../../data/model/submit_form_remote_post_model.dart';
import '../../data/model/submit_form_remote_response_model.dart';

abstract class Repository {
  final RemoteService remoteService;

  const Repository({required this.remoteService});

  Future<Either<Failure, List<BlogRemoteResponseModel>>> getBlogsRemote(
      BlogRemotePostModel model);

  Future<Either<Failure, SubmitFormRemoteResponseModel>> submitForm(
      SubmitFormRemotePostModel model);
}
