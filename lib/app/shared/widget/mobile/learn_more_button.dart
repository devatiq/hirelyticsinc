import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/utils/constants/dimens.dart';
import '../../../../core/utils/constants/strings.dart';
import '../../../../core/utils/style/text_styles.dart';

class LearnMoreButton extends StatelessWidget {
  const LearnMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.primary;
    final onBackgroundColor = Theme.of(context).colorScheme.onPrimary;
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimens.padding24, vertical: Dimens.padding12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(Dimens.borderRadius10),
        ),
        child: Text(
          learnMoreText,
          style: AppTextStyles.subtitleTextStyle(context,
                  fontSize: Dimens.fontSize16, color: onBackgroundColor)
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
