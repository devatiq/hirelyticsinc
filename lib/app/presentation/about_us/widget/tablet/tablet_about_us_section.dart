import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/constants/strings.dart';
import 'package:hirelyticsinc/core/utils/style/text_styles.dart';

import '../../../../../core/utils/constants/assets.dart';
import '../../../../shared/widget/mobile/stack_image_view_widget.dart';
import '../../../team/widget/tablet/tablet_team_section.dart';

class TabletAboutUsSection extends StatelessWidget {
  const TabletAboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.symmetric(horizontal: Dimens.horizontalSpace),
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(40),
          Text(
            aboutUsText,
            style: AppTextStyles.titleTextStyle(context,
                fontSize: Dimens.fontSize25),
          ),
          Gap(16),
          Text(
            atHirelyticsWeAreDedicatedTo,
            style: AppTextStyles.subtitleTextStyle(context,
                fontSize: Dimens.fontSize16),
          ),
          Gap(32),
          const StackImageViewWidget(
            bigImage: Assets.aboutImage1,
            smallImage: Assets.aboutImage2,
            smallImageAlignmentLeft: 0,
            smallImageAlignmentBottom: 10,
          ),
          const Gap(32),
          Align(
            alignment: Alignment.center,
            child: Text(
              meetTheTeam,
              textAlign: TextAlign.center,
              style: AppTextStyles.titleTextStyle(context, fontSize: 25),
            ),
          ),
          const Gap(16),
          const TabletTeamSection(),
          const Gap(32),
        ],
      ),
    );
  }
}
