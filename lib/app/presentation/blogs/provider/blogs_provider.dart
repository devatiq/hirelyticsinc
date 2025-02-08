import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirelyticsinc/app/data/model/blog_remote_response_model.dart';
import 'package:hirelyticsinc/app/domain/entity/blog_entity.dart';
import 'package:hirelyticsinc/app/domain/usecase/get_blogs_use_case.dart';
import 'package:hirelyticsinc/core/utils/resource/dependency_injection.dart';

final blogProvider = FutureProvider<List<BlogEntity>>((ref) async {
  final params = GetBlogsParams(page: 1, perPage: 10);
  final result = await getIt<GetBlogsUseCase>().call(params);
  return result.fold((l) => [], (r) => r);
});

final blogPaginationProvider =
    NotifierProvider<BlogPaginationNotifier, List<BlogEntity>>(
        () => BlogPaginationNotifier());

class BlogPaginationNotifier extends Notifier<List<BlogEntity>> {
  int _currentPage = 1;
  final int perPage = 10;
  bool _hasMore = true;
  bool _isLoading = false;

  @override
  List<BlogEntity> build() {
    fetchBlogs();
    return [];
  }

  Future<void> fetchBlogs() async {
    if (_isLoading || !_hasMore) return;
    _isLoading = true;

    final params = GetBlogsParams(page: _currentPage, perPage: perPage);
    final result = await getIt<GetBlogsUseCase>().call(params);
    result.fold(
      (l) => _hasMore = false, // stop fetching if there is an error
      (r) {
        if (r.isEmpty) {
          _hasMore = false; // No more data
        } else {
          state = [...state, ...r]; // Add new data to the existing list
          _currentPage++; // Move to the next page
        }
      },
    );

    _isLoading = false;

    print('hasMore: $_hasMore, isLoading: $_isLoading');
  }

  bool get hasMore => _hasMore;

  bool get isLoading => _isLoading;
}
