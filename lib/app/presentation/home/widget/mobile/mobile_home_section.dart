import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/app/shared/widget/mobile/learn_more_button.dart';
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
          Gap(40),
          Text(
            empoweringInnovationText,
            style: AppTextStyles.titleTextStyle(context,
                fontSize: Dimens.fontSize35),
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
          LearnMoreButton(),
          const Gap(24),
          _buildCountingTextData(
            context,
            count: 44,
            countExtension: '%',
            subtitle:
                'of companies don’t use data analytics to improve their hiring process',
          ),
          Gap(8),
          _buildCountingTextData(context,
              count: 40,
              countExtension: '%',
              subtitle:
                  'faster time-to-hire for companies using data-driven strategies',
              titleColor: Theme.of(context).primaryColor),
          Gap(8),
          _buildCountingTextData(
            context,
            count: 3,
            countExtension: 'x',
            subtitle:
                'more accurate candidate selection powered by predictive analytics',
          ),
          Gap(32),
        ],
      ),
    );
  }

  Widget _buildCountingTextData(BuildContext context,
      {required double count,
      required String countExtension,
      required String subtitle,
      Color? titleColor,
      Color? subtitleColor}) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Countup(
            begin: 0,
            end: count,
            duration: Duration(seconds: 2),
            curve: Curves.decelerate,
            textAlign: TextAlign.center,
            separator: ',',
            style: AppTextStyles.titleTextStyle(context,
                fontSize: 30, color: titleColor),
            suffix: countExtension,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.subtitleTextStyle(context,
                fontSize: 10, color: subtitleColor),
          ),
        ],
      ),
    );
  }
}
