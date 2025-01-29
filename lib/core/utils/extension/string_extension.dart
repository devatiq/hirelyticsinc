

extension StringExtention on String? {
  String toCapitalize() {
    if (this?.isEmpty ?? true) {
      return '';
    }
    return "${this?[0].toUpperCase()}${this?.substring(1).toLowerCase()}";
  }

  String get toTitleCase {
    if (this?.isEmpty ?? true) {
      return '';
    }
    return "${this?.split(' ').map((e) => e.toCapitalize()).join(' ')}";
  }

  DateTime? get toDateTime {
    if (this == null || this!.isEmpty) {
      return null;
    }
    try {
      final dateTime = DateTime.parse(this!);
      return dateTime;
    } catch (e) {
      return null;
    }
  }
}
