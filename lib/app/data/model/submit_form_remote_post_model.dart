class SubmitFormRemotePostModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String message;

  const SubmitFormRemotePostModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'input_1_1_3': firstName,
      'input_1_1_6': lastName,
      'input_1_3': email,
      'input_1_4': phone,
      'input_1_5': message,
    };
  }

  factory SubmitFormRemotePostModel.fromMap(Map<String, dynamic> map) {
    return SubmitFormRemotePostModel(
      firstName: map['input_1_1_3'] as String,
      lastName: map['input_1_1_6'] as String,
      email: map['input_1_3'] as String,
      phone: map['input_1_4'] as String,
      message: map['input_1_5'] as String,
    );
  }
}
