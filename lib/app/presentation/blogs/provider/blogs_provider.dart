import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirelyticsinc/app/data/model/blog_remote_response_model.dart';
import 'package:hirelyticsinc/app/domain/entity/blog_entity.dart';
import 'package:hirelyticsinc/app/domain/usecase/get_blogs_use_case.dart';
import 'package:hirelyticsinc/core/utils/resource/dependency_injection.dart';

final blogProvider = FutureProvider<List<BlogEntity>>((ref) async {
  final params = GetBlogsParams(id: 0);
  final result = await getIt<GetBlogsUseCase>().call(params);
  return result.fold((l) => [], (r) => r);
});
