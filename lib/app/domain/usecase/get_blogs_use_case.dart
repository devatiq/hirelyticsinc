import 'package:fpdart/src/either.dart';
import 'package:hirelyticsinc/app/data/model/blog_remote_post_model.dart';
import 'package:hirelyticsinc/app/domain/entity/blog_entity.dart';
import 'package:hirelyticsinc/app/domain/repository/repository.dart';
import 'package:hirelyticsinc/core/error/data_state.dart';
import 'package:hirelyticsinc/core/usecase/usecase.dart';

import '../../data/model/blog_remote_response_model.dart';

class GetBlogsUseCase implements UseCase<List<BlogEntity>, GetBlogsParams> {
  final Repository repository;

  const GetBlogsUseCase(this.repository);

  @override
  Future<Either<Failure, List<BlogEntity>>> call(GetBlogsParams params) async {
    final result = await repository.getBlogsRemote(
        BlogRemotePostModel(page: params.page, perPage: params.perPage));
    return result.fold((l) => Left(l), (r) {
      final entityList = r
          .map((e) => BlogEntity(
                id: e.id,
                title: e.title,
                excerpt: e.excerpt,
                content: e.content,
                featuredImage: e.featuredImage,
                category: e.category ?? [],
                link: e.link,
              ))
          .toList();
      return Right(entityList);
    });
  }
}

class GetBlogsParams {
  final int? page;
  final int? perPage;

  const GetBlogsParams({this.page, this.perPage});
}
