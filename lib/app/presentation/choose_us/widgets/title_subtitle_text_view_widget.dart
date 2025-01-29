import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/core/utils/style/text_styles.dart';

class TitleSubtitleTextViewWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleSubtitleTextViewWidget(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.titleTextStyle(context, fontSize: 18),
        ),
        Gap(8),
        Text(
          subtitle,
          style: AppTextStyles.subtitleTextStyle(context, fontSize: 16),
        ),
      ],
    );
  }
}
