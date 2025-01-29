
class FieldValidators {
  static String? Function(String? value)? nameValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return "Name empty";
    }
    return null;
  };

  static String? Function(String? value)? emailValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }
    // if (!EmailValidator.validate(value.trim())) {
    //   return 'Enter a valid email';
    // }
    return null;
  };

  static String? Function(String? value)? emailNullableValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    // if (!EmailValidator.validate(value.trim())) {
    //   return 'Enter a valid email';
    // }
    return null;
  };

  static String? Function(String? value)? phoneValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return "Phone number is required";
    } else if (value.length != 11) {
      return "Phone number length should be 11 digit";
    }
    return null;
  };

  static String? Function(String? value)? emailOrPhoneValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return "Email or phone is required";
    }

    if (value.contains(RegExp(r'[a-zA-Z]')) ||
        value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      //is a email
      // if (!EmailValidator.validate(value.trim())) {
      //   return 'Enter a valid email';
      // }
    } else {
      //is a number
      if (value.length != 11) {
        return "Phone number length should be 11 digit";
      }
    }

    return null;
  };

  static String? Function(String? value)? phoneEmptyButNotInvalidValidator =
      (value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    } else if (value.length != 11) {
      return "Phone number length should be 11 digit";
    }
    return null;
  };

  static String? Function(String? value)? thanaValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return "Thana is required";
    }
    return null;
  };

  static String? Function(String? value)? passwordValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return "Password is required";
    } else if (value.length < 6) {
      return 'Password length should be 6 or more';
    }
    return null;
  };

  static String? Function(String? value, {String? anotherValue})?
      repeatPasswordValidator = (value, {anotherValue}) {
    if (value == null || value.trim().isEmpty) {
      return "Repeat password is required";
    } else if (value.trim() != anotherValue?.trim()) {
      return "Password didn't match";
    }
    return null;
  };

  static String? Function(String? value)? emptyOrNullValidator = (value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return "Can not be empty";
    }
    return null;
  };

  static String? Function(String? value, {required String fieldName})?
      customEmptyOrNullValidator = (value, {required String fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    return null;
  };
}
