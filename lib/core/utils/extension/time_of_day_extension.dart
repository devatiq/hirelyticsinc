import 'package:flutter/material.dart';
import 'package:hirelyticsinc/core/utils/extension/number_extension.dart';

extension TimeOfDayExtension on TimeOfDay? {
  String? get formatTimeOfDay =>
      this == null ? null : '${this?.hour}:${this?.minute}';

  String get format12Hour {
    return '${this?.hourOfPeriod.timeFormat}:${this?.minute.timeFormat}';
  }

  String format12HourWithPeriod(BuildContext context) {
    TimeOfDay? time = this?.replacing(hour: this?.hourOfPeriod);
    MaterialLocalizations localizations = MaterialLocalizations.of(context);

    final StringBuffer buffer = StringBuffer();

    buffer
      ..write(time?.format(context))
      ..write(' ')
      ..write(this?.period == DayPeriod.am
          ? localizations.anteMeridiemAbbreviation
          : localizations.postMeridiemAbbreviation);

    return '$buffer';
  }

  TimeOfDay add({int hour = 0, int minute = 0}) {
    return TimeOfDay.fromDateTime(DateTime.now()
        .copyWith(hour: this?.hour, minute: this?.minute)
        .add(Duration(hours: hour, minutes: minute)));
  }

  TimeOfDay subtract({int hour = 0, int minute = 0}) {
    return TimeOfDay.fromDateTime(DateTime.now()
        .copyWith(hour: this?.hour, minute: this?.minute)
        .subtract(Duration(hours: hour, minutes: minute)));
  }

  Duration difference(TimeOfDay? other) {
    return DateTime.now()
        .copyWith(hour: this?.hour, minute: this?.minute)
        .difference(
            DateTime.now().copyWith(hour: other?.hour, minute: other?.minute));
  }

  DateTime get toDate => DateTime.now().copyWith(
        hour: this?.hour,
        minute: this?.minute,
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );
  DateTime get toDateAsEndOfMinute => DateTime.now().copyWith(
    hour: this?.hour,
    minute: this?.minute,
    second: 59,
    millisecond: 0,
    microsecond: 0,
  );
}
