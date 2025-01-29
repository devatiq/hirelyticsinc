import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/extension/context_extension.dart';
import 'package:hirelyticsinc/core/utils/style/text_styles.dart';

import '../../../../../core/utils/constants/strings.dart';

class MobileHomeSection extends StatelessWidget {
  const MobileHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.kGradiantHomePage),
      padding: EdgeInsets.symmetric(horizontal: Dimens.horizontalSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(60),
          Text(
            empoweringInnovationText,
            style: AppTextStyles.titleTextStyle(context,
                fontSize: Dimens.fontSize40),
          ),
          const Gap(16),
          Text(
            scaleSmarterText,
            style: AppTextStyles.subtitleTextStyle(
              context,
              fontSize: Dimens.fontSize16,
            ),
          ),
          const Gap(16),
          InkWell(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimens.padding24, vertical: Dimens.padding16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(Dimens.borderRadius16),
              ),
              child: Text(
                learnMoreText,
                style: AppTextStyles.subtitleTextStyle(context,
                    fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          const Gap(24),
          _buildTextData(
            context,
            title: '44%',
            subtitle:
                'of companies don’t use data analytics to improve their hiring process',
          ),
          Gap(8),
          _buildTextData(context,
              title: '40%',
              subtitle:
                  'faster time-to-hire for companies using data-driven strategies',
              titleColor: Theme.of(context).primaryColor),
          Gap(8),
          _buildTextData(
            context,
            title: '3x',
            subtitle:
                'more accurate candidate selection powered by predictive analytics',
          ),
          Gap(32),
        ],
      ),
    );
  }

  Widget _buildTextData(BuildContext context,
      {required String title,
      required String subtitle,
      Color? titleColor,
      Color? subtitleColor}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.titleTextStyle(context,
              fontSize: 30, color: titleColor),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitleTextStyle(context,
              fontSize: 12, color: subtitleColor),
        ),
      ],
    );
  }
}
