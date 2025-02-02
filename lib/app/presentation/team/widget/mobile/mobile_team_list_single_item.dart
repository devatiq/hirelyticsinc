import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/extension/context_extension.dart';
import 'package:hirelyticsinc/core/utils/helper/common_style.dart';

import '../../../../../core/utils/style/text_styles.dart';
import '../../team_view_model.dart';

class MobileTeamListSingleItem extends StatelessWidget {
  final TeamViewModel item;
  const MobileTeamListSingleItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          boxShadow: CommonStyle.boxShadow(colorOpacity: 0.15),
          borderRadius: BorderRadius.circular(Dimens.borderRadius16)),
      child: Column(
        children: [
          Expanded(
            child: ColorFiltered(
              colorFilter: ColorFilter.matrix(
                [
                  // Adjusting brightness (91%) and grayscale (saturate(0%))
                  0.2126 * 0.91, 0.7152 * 0.91, 0.0722 * 0.91, 0, 0, // Red

                  0.2126 * 0.91, 0.7152 * 0.91, 0.0722 * 0.91, 0, 0, // Green

                  0.2126 * 0.91, 0.7152 * 0.91, 0.0722 * 0.91, 0, 0, // Blue

                  0, 0, 0, 1, 10, // Alpha
                ],
              ),
              child: SizedBox(
                  width: double.infinity,
                  //height: height * 0.7,
                  child: ColoredBox(color: Colors.white, child: FlutterLogo())),
            ),
          ),
          Gap(Dimens.padding16),
          Text('Abraham Roman',
              style: AppTextStyles.titleTextStyle(context,
                  fontSize: Dimens.fontSize24)),
          Gap(Dimens.padding8),
          Text('Solutions Specialist',
              style: AppTextStyles.subtitleTextStyle(context,
                  fontSize: Dimens.fontSize18)),
          Gap(Dimens.padding8),
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: Dimens.padding16,
            children: List.generate(
              4,
              (index) => Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius:
                          BorderRadius.circular(Dimens.borderRadius6)),
                  child: Icon(Icons.star, color: AppColors.colorWhite)),
            ),
          ),
          Divider(
            color: AppColors.colorGreyLight,
            indent: Dimens.padding16,
            endIndent: Dimens.padding16,
            height: Dimens.padding40,
          ),
          TextButton(onPressed: () {}, child: Text('View Bio'))
        ],
      ),
    );
  }
}
