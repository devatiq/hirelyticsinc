import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hirelyticsinc/core/utils/constants/assets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/utils/constants/dimens.dart';

class FooterSocialIconsWidget extends StatelessWidget {
  final String assets;
  final String toolTip;
  final String url;

  const FooterSocialIconsWidget(
      {super.key,
      required this.assets,
      required this.toolTip,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTip,
      child: InkWell(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            launchUrl(uri);
          }
        },
        child: Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(Dimens.padding10),
          decoration: BoxDecoration(
              color: AppColors.colorWhite, shape: BoxShape.circle),
          child: SvgPicture.asset(assets),
        ),
      ),
    );
  }
}
