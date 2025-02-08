class SubmitFormRemoteResponseModel {
  SubmitFormRemoteResponseModel({
    this.status,
    this.message,
  });

  SubmitFormRemoteResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }

  num? status;
  String? message;

  SubmitFormRemoteResponseModel copyWith({
    num? status,
    String? message,
  }) =>
      SubmitFormRemoteResponseModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}
