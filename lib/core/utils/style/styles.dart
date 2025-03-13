import 'package:flutter/material.dart';

import '../constants/dimens.dart';

const DecoratedBox kDecoratedBox = DecoratedBox(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    color: Colors.white,
  ),
);

const BorderRadius curvedTopBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(30),
  topRight: Radius.circular(30),
);

final horizontalPadding = const EdgeInsets.symmetric(horizontal: Dimens.horizontalSpace);
