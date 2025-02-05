import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hirelyticsinc/core/utils/helper/url_launcher_helper.dart';

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
          if (url.trim().isEmpty) return;
          UrlLauncherHelper.launchURL(data: url, type: UrlLaunchType.url);
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
