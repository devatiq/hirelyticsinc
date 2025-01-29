import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  TimeOfDay get toTimeOfDay => TimeOfDay(hour: hour, minute: minute);

  DateTime get dayStartTime =>
      copyWith(hour: 0, minute: 0, second: 0, millisecond: 1);

  DateTime get dayEndTime =>
      copyWith(hour: 23, minute: 59, second: 59, millisecond: 0);

  String formatDate({required String pattern}) {
    return DateFormat(pattern).format(toLocal());
  }

  bool isSameDay({DateTime? other}) {
    other ??= DateTime.now();
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameMonth({DateTime? other}) {
    other ??= DateTime.now();
    return year == other.year && month == other.month;
  }

  bool isSameYear({DateTime? other}) {
    other ??= DateTime.now();
    return year == other.year;
  }

  bool isSameHour({DateTime? other}) {
    other ??= DateTime.now();
    return hour == other.hour;
  }

  bool isSameMinute({DateTime? other}) {
    other ??= DateTime.now();
    return minute == other.minute;
  }
}
