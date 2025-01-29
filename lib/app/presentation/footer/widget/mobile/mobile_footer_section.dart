import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';
import 'package:hirelyticsinc/core/utils/style/text_styles.dart';

import '../../../../../core/utils/constants/assets.dart';
import '../../../../../core/utils/constants/strings.dart';

class MobileFooterSection extends StatelessWidget {
  const MobileFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final background = AppColors.colorFooterBackground;
    final textColor = AppColors.colorWhite;
    return Container(
      decoration: BoxDecoration(color: background),
      child: DefaultTextStyle(
        style: TextStyle(color: textColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40),
            Image.asset(
              Assets.logo,
              color: AppColors.colorBlack,
              colorBlendMode: BlendMode.difference,
            ),
            Gap(16),
            Text(
              connectText,
              style: AppTextStyles.titleTextStyle(context, fontSize: 20),
            ),
            Gap(16),
          ],
        ),
      ),
    );
  }
}
