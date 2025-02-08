class BlogRemotePostModel {
  final int? page;
  final int? perPage;

  const BlogRemotePostModel({
    required this.page,
    required this.perPage,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'per_page': perPage,
    };
  }

  factory BlogRemotePostModel.fromMap(Map<String, dynamic> map) {
    return BlogRemotePostModel(
      page: map['page'] as int?,
      perPage: map['per_page'] as int?,
    );
  }
}
