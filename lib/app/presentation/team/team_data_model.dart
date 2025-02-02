class TeamDataModel {
  TeamDataModel({
    this.id,
    this.name,
    this.designation,
    this.details,
    this.priority,
    this.image,
    this.socials,
  });

  TeamDataModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    designation = json['designation'];
    details = json['details'];
    priority = json['priority'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    if (json['socials'] != null) {
      socials = [];
      json['socials'].forEach((v) {
        socials?.add(Socials.fromJson(v));
      });
    }
  }

  int? id;
  String? name;
  String? designation;
  String? details;
  int? priority;
  Image? image;
  List<Socials>? socials;

  TeamDataModel copyWith({
    int? id,
    String? name,
    String? designation,
    String? details,
    int? priority,
    Image? image,
    List<Socials>? socials,
  }) =>
      TeamDataModel(
        id: id ?? this.id,
        name: name ?? this.name,
        designation: designation ?? this.designation,
        details: details ?? this.details,
        priority: priority ?? this.priority,
        image: image ?? this.image,
        socials: socials ?? this.socials,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['designation'] = designation;
    map['details'] = details;
    map['priority'] = priority;
    if (image != null) {
      map['image'] = image?.toJson();
    }
    if (socials != null) {
      map['socials'] = socials?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Socials {
  Socials({
    this.name,
    this.url,
  });

  Socials.fromJson(dynamic json) {
    name = json['name'];
    url = json['url'];
  }

  String? name;
  String? url;

  Socials copyWith({
    String? name,
    String? url,
  }) =>
      Socials(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    return map;
  }
}

class Image {
  Image({
    this.source,
    this.url,
  });

  Image.fromJson(dynamic json) {
    source = json['source'];
    url = json['url'];
  }

  String? source;
  String? url;

  Image copyWith({
    String? source,
    String? url,
  }) =>
      Image(
        source: source ?? this.source,
        url: url ?? this.url,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['source'] = source;
    map['url'] = url;
    return map;
  }
}
