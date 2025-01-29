import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/constants/strings.dart';
import 'package:hirelyticsinc/core/utils/style/text_styles.dart';

class MobileAboutUsSection extends StatelessWidget {
  const MobileAboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.horizontalSpace),
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(40),
          Text(
            aboutUsText,
            style: AppTextStyles.titleTextStyle(context, fontSize: 25),
          ),
          Gap(16),
          Text(
            atHirelyticsWeAreDedicatedTo,
            style: AppTextStyles.subtitleTextStyle(context, fontSize: 16),
          ),
          Gap(16),
          SizedBox(height: 400, child: Placeholder()),
          Gap(32),
          Align(
            alignment: Alignment.center,
            child: Text(
              meetTheTeam,
              textAlign: TextAlign.center,
              style: AppTextStyles.titleTextStyle(context, fontSize: 25),
            ),
          ),
          Gap(16),
          //TODO: team list
        ],
      ),
    );
  }
}
