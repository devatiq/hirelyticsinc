/*
 * helper functions
 */

import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hirelyticsinc/core/utils/extension/context_extension.dart';

import '../../../core/utils/helper/datetime_helper.dart';
import '../constants/app_constants.dart';
import '../constants/dimens.dart';
import '../enums/message_type.dart';

void showAppSnackBar(
  BuildContext context,
  String? msg, {
  SnackBarAction? action,
  int durationInSeconds = 2,
  required MessageType type,
  SnackBarBehavior behavior = SnackBarBehavior.floating,
  bool hasRadius = true,
  EdgeInsets? padding,
  bool alignBottom = true,
  DismissDirection? direction,
  ShapeBorder? shape,
}) {
  Color color = getMessageColor(type);

  final isFixed = behavior == SnackBarBehavior.fixed;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isFixed ? null : Colors.transparent,
      elevation: 0,
      behavior: behavior,
      padding: isFixed ? null : EdgeInsets.zero,
      dismissDirection: direction,
      shape: shape,
      //width: 400,
      //margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: isFixed
          ? null
          : alignBottom
              ? null
              : EdgeInsets.only(bottom: 110),

      content: Container(
          padding: isFixed
              ? null
              : padding ?? EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
            color: isFixed ? null : color,
            borderRadius: hasRadius ? BorderRadius.circular(4) : null,
          ),
          child: Text(
            msg ?? 'Error',
            textAlign: isFixed ? TextAlign.start : TextAlign.center,
            style: TextStyle(
                fontSize: 11, color: context.colorScheme.onPrimary, height: 1),
          )),
      duration: Duration(seconds: durationInSeconds),
      action: action,
    ),
  );
}

String trimToElevenDigits(String phoneNumber) {
  // Remove non-numeric characters
  String sanitizedNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

  // Remove the country code '88' if present at the beginning
  if (sanitizedNumber.startsWith('88')) {
    sanitizedNumber = sanitizedNumber.substring(2);
  }

  // Ensure the number is trimmed to the last 11 digits if it exceeds 11 digits
  if (sanitizedNumber.length > 11) {
    sanitizedNumber = sanitizedNumber.substring(sanitizedNumber.length - 11);
  }

  return sanitizedNumber;
}

Future<T?> showAppDialog<T>(BuildContext context,
    {required Widget dialogWidget, bool barrierDismissible = true}) async {
  return await showGeneralDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: 'Dialog Outside',
    pageBuilder: (context, animation, secondaryAnimation) {
      return dialogWidget;
    },
  );
}

Future<dynamic> showProgressDialog(BuildContext context,
    {String? customMessage}) async {
  return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SimpleDialog(
            contentPadding: const EdgeInsets.all(8.0),
            children: [
              ListTile(
                title: Text(customMessage ?? 'Please Wait...'),
                trailing: const CircularProgressIndicator(),
              ),
            ],
          ));
}

Future<DateTime?> showDatePickerDialog({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  final selectedDate = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime(1970),
    lastDate: lastDate ?? DateTime(2030),
  );
  return selectedDate;
}

List<String> stringToListWithRx(String str) {
  // Use a regular expression to remove all unwanted characters
  String cleanedVal = str.replaceAll(RegExp(r'[^0-9a-zA-Z,-]'), '');

  // Split the string by commas to get a list
  List<String> numberList = cleanedVal.split(',');

  // Remove any empty strings from the list (in case there are multiple commas together)
  numberList = numberList.where((element) => element.isNotEmpty).toList();

  return numberList;
}

List<String> stringToList(String str) {
  // Split the string by commas to get a list
  List<String> list = str.split(',');

  // Remove any empty strings from the list (in case there are multiple commas together)
  list = list.where((element) => element.isNotEmpty).toList();

  return list;
}

List<String> filterList(List<String> list, String search) {
  return list.where((element) => element.contains(search)).toList();
}

num get getMillisecondsSinceEpoch => getCurrentDateTime.millisecondsSinceEpoch;

DateTime get today => DateTime.now()
    .copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);

String generateRemoteImageUrl({required String endPoint}) {
  if (endPoint.isEmpty) {
    return '';
  }
  return '${AppConstants.appImageLoadBaseUrl}$endPoint';
}

Future<dynamic> loadJsonFromAssets(String filePath) async {
  String jsonString = await rootBundle.loadString(filePath);
  final json = jsonDecode(jsonString);

  return json;
}
