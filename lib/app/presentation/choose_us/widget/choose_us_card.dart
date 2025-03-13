import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/helper/common_style.dart';

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
      width: double.infinity,
      padding: const EdgeInsets.all(Dimens.padding24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: CommonStyle.boxShadow(blurRadius: 10, colorOpacity: 0.1),
        borderRadius: BorderRadius.circular(Dimens.borderRadius24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(Dimens.padding16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.borderRadius16),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: SvgPicture.asset(
              icon,
              height: Dimens.iconSize40,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onSecondary, BlendMode.srcIn),
            ),
          ),
          const Gap(16),
          Text(
            title,
            style: AppTextStyles.titleTextStyle(context, fontSize: 20),
          ),
          const Gap(16),
          Text(
            description,
            style: AppTextStyles.subtitleTextStyle(context, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
