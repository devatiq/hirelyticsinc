class BlogRemoteResponseModel {
  BlogRemoteResponseModel({
    this.id,
    this.title,
    this.excerpt,
    this.content,
    this.featuredImage,
    this.category,
    this.link,
  });

  BlogRemoteResponseModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    excerpt = json['excerpt'];
    content = json['content'];
    featuredImage = json['featured_image'];
    category = json['category'] != null ? json['category'].cast<String>() : [];
    link = json['link'];
  }

  int? id;
  String? title;
  String? excerpt;
  String? content;
  String? featuredImage;
  List<String>? category;
  String? link;

  BlogRemoteResponseModel copyWith({
    int? id,
    String? title,
    String? excerpt,
    String? content,
    String? featuredImage,
    List<String>? category,
    String? link,
  }) =>
      BlogRemoteResponseModel(
        id: id ?? this.id,
        title: title ?? this.title,
        excerpt: excerpt ?? this.excerpt,
        content: content ?? this.content,
        featuredImage: featuredImage ?? this.featuredImage,
        category: category ?? this.category,
        link: link ?? this.link,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['excerpt'] = excerpt;
    map['content'] = content;
    map['featured_image'] = featuredImage;
    map['category'] = category;
    map['link'] = link;
    return map;
  }
}
