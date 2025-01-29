import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/helper/common_style.dart';

import '../../../../core/utils/constants/assets.dart';
import '../../../../core/utils/style/text_styles.dart';

class ChooseUsCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;

  const ChooseUsCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      padding: EdgeInsets.all(Dimens.padding24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: CommonStyle.boxShadow(blurRadius: 10, colorOpacity: 0.05),
        borderRadius: BorderRadius.circular(Dimens.borderRadius24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(Dimens.padding16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.borderRadius16),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Image.asset(
              icon,
              height: Dimens.iconSize40,
            ),
          ),
          Gap(16),
          Text(
            title,
            style: AppTextStyles.titleTextStyle(context, fontSize: 20),
          ),
          Gap(16),
          Text(
            description,
            style: AppTextStyles.subtitleTextStyle(context, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
