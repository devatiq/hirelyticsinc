import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/constants/assets.dart';
import '../../../../../core/utils/constants/dimens.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/style/text_styles.dart';
import '../../../../shared/widget/mobile/stack_image_view_widget.dart';
import '../choose_us_card.dart';
import '../title_subtitle_text_view_widget.dart';

class TabletWhyChooseUsSection extends StatelessWidget {
  const TabletWhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.horizontalSpace),
      child: Column(
        children: [
          const Gap(40),
          Text(
            keyChallengesKeepingText,
            textAlign: TextAlign.center,
            style: AppTextStyles.titleTextStyle(context, fontSize: 25),
          ),
          const Gap(16),
          Text(
            atHirelyticsWeUnderstand,
            textAlign: TextAlign.center,
            style: AppTextStyles.subtitleTextStyle(context, fontSize: 16),
          ),
          const Gap(16),
          _buildCard(context),
          const Gap(16),
          const StackImageViewWidget(
            bigImage: Assets.chooseUsImage1,
            smallImage: Assets.chooseUsImage2,
            smallImageAlignmentRight: 0,
            smallImageAlignmentBottom: 10,
          ),
          const Gap(16),
          Text(
            whyHirelyticsText,
            style: AppTextStyles.titleTextStyle(context, fontSize: 25),
          ),
          const Gap(16),
          Text(
            atHirelyticsWeDontJustSolveProblems,
            style: AppTextStyles.subtitleTextStyle(context, fontSize: 16),
          ),
          const Gap(16),
          _buildChooseList(context),
          const Gap(32),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    final list = whyChooseUsCardInfoList;
    return Row(
      spacing: Dimens.padding16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        list.length,
        (index) => Expanded(
          child: ChooseUsCard(
              icon: list[index].icon,
              title: list[index].titleDescription.title,
              description: list[index].titleDescription.description),
        ),
      ),
    );
  }

  Widget _buildChooseList(BuildContext context) {
    final list = whyChooseUseReasonList;
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        spacing: Dimens.padding16,
        children: List.generate(
            list.length,
            (index) => TitleSubtitleTextViewWidget(
                title: list[index].title, subtitle: list[index].description)),
      ),
    );
  }
}
