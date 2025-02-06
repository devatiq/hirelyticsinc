class BlogRemotePostModel {
  final int id;

  const BlogRemotePostModel({
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
    };
  }

  factory BlogRemotePostModel.fromMap(Map<String, dynamic> map) {
    return BlogRemotePostModel(
      id: map['id'] as int,
    );
  }
}
