import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/constants/strings.dart';
import 'package:hirelyticsinc/core/utils/style/text_styles.dart';

import '../../../../shared/widget/mobile/learn_more_button.dart';
import '../mobile/mobile_service_card_widget.dart';

class TabletServiceSection extends StatelessWidget {
  const TabletServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.horizontalSpace),
      decoration: const BoxDecoration(gradient: AppColors.kGreyGradiant),
      child: Column(
        children: [
          const Gap(40),
          Text(
            top3SolutionToYourProblem,
            textAlign: TextAlign.center,
            style: AppTextStyles.titleTextStyle(context, fontSize: 25),
          ),
          const Gap(16),
          _buildServiceCards(context),
          const Gap(16),
          Text(
            readyToSolveYourChallenges,
            textAlign: TextAlign.center,
            style: AppTextStyles.subtitleTextStyle(context,
                fontSize: Dimens.fontSize16),
          ),
          const Gap(16),
          const LearnMoreButton(),
          const Gap(32),
        ],
      ),
    );
  }

  Widget _buildServiceCards(BuildContext context) {
    final list = serviceCardInfoList;
    return Row(
      spacing: Dimens.padding16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          list.length,
              (index) => Expanded(
                child: MobileServiceCardWidget(
                    image: list[index].image,
                    title: list[index].titleDescription.title,
                    description: list[index].titleDescription.description),
              )),
    );
  }
}
