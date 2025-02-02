import 'package:equatable/equatable.dart';

class TeamViewModel extends Equatable {
  final int id;
  final String name;
  final String designation;
  final String details;
  final int priority;
  final TeamImage image;
  final List<TeamSocials> socials;

  const TeamViewModel({
    required this.id,
    required this.name,
    required this.designation,
    required this.details,
    required this.priority,
    required this.image,
    required this.socials,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        designation,
        details,
        priority,
        image,
        socials,
      ];
}

class TeamSocials extends Equatable {
  final SocialType type;
  final String url;

  TeamSocials({required String name, required this.url})
      : type = SocialType.valueOf(name);

  @override
  List<Object?> get props => [type, url];
}

enum SocialType {
  fb,
  x,
  linkedIn,
  web;

  static SocialType valueOf(String name) {
    switch (name) {
      case 'fb':
        return SocialType.fb;
      case 'x':
      case 'twitter':
        return SocialType.x;
      case 'linkedIn':
        return SocialType.linkedIn;
      case 'web':
        return SocialType.web;
      default:
        return SocialType.web;
    }
  }
}

class TeamImage extends Equatable {
  final ImgSource source;
  final String url;

  TeamImage({required String sourceName, required this.url})
      : source = ImgSource.valueOf(sourceName);

  @override
  List<Object?> get props => [source, url];
}

enum ImgSource {
  assets,
  network;

  static ImgSource valueOf(String name) {
    switch (name) {
      case 'assets':
        return ImgSource.assets;
      case 'network':
        return ImgSource.network;
      default:
        return ImgSource.assets;
    }
  }
}
