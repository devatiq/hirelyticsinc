import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

extension NumberExtension on num {
  String get moneyNumberFormat {
    final format = NumberFormat(",###");
    return format.format(this);
  }

  String get moneyNumberFormatWithDecimal {
    final format = NumberFormat(",##0.00");
    return format.format(this);
  }

  String get locationLatLngFormat {
    final format = NumberFormat("##0.00");
    return format.format(this);
  }

  String get doubleOrIntString {
    final format = NumberFormat('0.##');
    return format.format(this);
  }

  String get timeFormat {
    final format = NumberFormat(
      "00",
    );
    return format.format(this);
  }

  String get meterToKm {
    return (this / 1000).toStringAsFixed(2);
  }

  String get kmToDistanceWithUnit {
    if (this > 1) {
      return '${toStringAsFixed(1)} km';
    }
    return '${(this * 1000).toStringAsFixed(0)} m';
  }

  SizedBox get wBox {
    return SizedBox(width: toDouble());
  }

  SizedBox get hBox {
    return SizedBox(height: toDouble());
  }

  Gap get gapH {
    return Gap(toDouble());
  }

  Gap get gapW {
    return Gap(toDouble());
  }

  Gap get gapR {
    return Gap(toDouble());
  }

  Gap get gap {
    return Gap(toDouble());
  }

  SliverGap get sliverGap {
    return SliverGap(toDouble());
  }

  SliverGap sliverGapBgColor(Color color) {
    return SliverGap(toDouble(), color: color);
  }
}
