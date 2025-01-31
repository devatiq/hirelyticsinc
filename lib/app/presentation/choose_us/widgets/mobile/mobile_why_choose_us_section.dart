import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/app/presentation/choose_us/widgets/choose_us_card.dart';
import 'package:hirelyticsinc/app/presentation/choose_us/widgets/title_subtitle_text_view_widget.dart';
import 'package:hirelyticsinc/core/utils/constants/strings.dart';
import 'package:hirelyticsinc/core/utils/style/text_styles.dart';

import '../../../../../core/utils/constants/assets.dart';
import '../../../../../core/utils/constants/dimens.dart';

class MobileWhyChooseUsSection extends StatelessWidget {
  const MobileWhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.horizontalSpace),
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Gap(40),
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
          ..._buildCard(context),
          const Gap(16),
          Placeholder(),
          Gap(16),
          Text(
            whyHirelyticsText,
            style: AppTextStyles.titleTextStyle(context, fontSize: 25),
          ),
          Gap(16),
          Text(
            atHirelyticsWeDontJustSolveProblems,
            style: AppTextStyles.subtitleTextStyle(context, fontSize: 16),
          ),
          Gap(16),
          ..._buildChooseList(context),
          Gap(32),

        ],
      ),
    );
  }

  List<Widget> _buildCard(BuildContext context) {
    final list = whyChooseUsCardInfoList;
    return List.generate(
      whyChooseUsCardInfoList.length,
          (index) =>
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ChooseUsCard(
                icon: list[index].icon,
                title: list[index].titleDescription.title,
                description: list[index].titleDescription.description),
          ),
    );
  }

  List<Widget> _buildChooseList(BuildContext context) {
    final list = whyChooseUseReasonList;
    return List.generate(list.length, (index) =>
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TitleSubtitleTextViewWidget(
              title: list[index].title, subtitle: list[index].description),
        ));
  }
}
