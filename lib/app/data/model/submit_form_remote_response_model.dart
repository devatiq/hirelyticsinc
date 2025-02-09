class SubmitFormRemoteResponseModel {
  SubmitFormRemoteResponseModel({
    this.isValid,
    this.pageNumber,
    this.sourcePageNumber,
    this.confirmationMessage,
    this.confirmationType,
    this.isSpam,
  });

  SubmitFormRemoteResponseModel.fromJson(dynamic json) {
    isValid = json['is_valid'];
    pageNumber = json['page_number'];
    sourcePageNumber = json['source_page_number'];
    confirmationMessage = json['confirmation_message'];
    confirmationType = json['confirmation_type'];
    isSpam = json['is_spam'];
  }

  bool? isValid;

  num? pageNumber;
  num? sourcePageNumber;
  String? confirmationMessage;
  String? confirmationType;
  bool? isSpam;

  SubmitFormRemoteResponseModel copyWith({
    bool? isValid,
    num? pageNumber,
    num? sourcePageNumber,
    String? confirmationMessage,
    String? confirmationType,
    bool? isSpam,
  }) =>
      SubmitFormRemoteResponseModel(
        isValid: isValid ?? this.isValid,
        pageNumber: pageNumber ?? this.pageNumber,
        sourcePageNumber: sourcePageNumber ?? this.sourcePageNumber,
        confirmationMessage: confirmationMessage ?? this.confirmationMessage,
        confirmationType: confirmationType ?? this.confirmationType,
        isSpam: isSpam ?? this.isSpam,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_valid'] = isValid;

    map['page_number'] = pageNumber;
    map['source_page_number'] = sourcePageNumber;
    map['confirmation_message'] = confirmationMessage;
    map['confirmation_type'] = confirmationType;
    map['is_spam'] = isSpam;
    return map;
  }
}
