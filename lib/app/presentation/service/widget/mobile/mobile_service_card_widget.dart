import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/style/text_styles.dart';

class MobileServiceCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const MobileServiceCardWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Dimens.padding16),
      decoration: BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(Dimens.borderRadius16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimens.borderRadius8),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                )),
          ),
          Gap(24),
          Text(
            title,
            style: AppTextStyles.titleTextStyle(context,
                fontSize: Dimens.fontSize20),
          ),
          Gap(16),
          Text(
            description,
            style: AppTextStyles.subtitleTextStyle(context,
                fontSize: Dimens.fontSize16),
          ),
        ],
      ),
    );
  }
}
