import 'package:equatable/equatable.dart';

class BlogEntity extends Equatable {
  final int? id;
  final String? title;
  final String? excerpt;
  final String? content;
  final String? featuredImage;
  final List<String> category;
  final String? link;

  const BlogEntity({
    required this.id,
    this.title,
    this.excerpt,
    this.content,
    this.featuredImage,
    required this.category,
    this.link,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        excerpt,
        content,
        featuredImage,
        category,
        link,
      ];
}
