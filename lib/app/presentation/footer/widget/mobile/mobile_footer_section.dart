import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/extension/context_extension.dart';
import 'package:hirelyticsinc/core/utils/style/text_styles.dart';

import '../../../../../core/utils/constants/assets.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/helper/url_launcher_helper.dart';
import '../footer_social_icons_widget.dart';

class MobileFooterSection extends StatelessWidget {
  const MobileFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final background = AppColors.colorFooterBackground;
    final textColor = AppColors.colorWhite;
    return Container(
      decoration: BoxDecoration(color: background),
      padding: EdgeInsets.symmetric(horizontal: Dimens.horizontalSpace),
      child: DefaultTextStyle(
        style: TextStyle(
            color: textColor, fontFamily: GoogleFonts.montserrat().fontFamily),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40),
            Image.asset(
              Assets.logoWhite,
              height: 40,
            ),
            Gap(16),
            Text(
              connectText,
              style: AppTextStyles.titleTextStyle(context, fontSize: 20),
            ),
            Gap(16),
            _buildSocialIcons(context),
            Gap(16),
            _buildAddress(context,
                icon: Assets.locationPinSvg,
                data: organizationContactAddress,
                onTap: () => UrlLauncherHelper.launchURL(
                    data: organizationLocationMapUrl,
                    type: UrlLaunchType.maps)),
            Gap(16),
            _buildAddress(context,
                icon: Assets.callDialSvg,
                data: organizationContactPhone1,
                onTap: () => UrlLauncherHelper.launchURL(
                    data: organizationContactPhone1,
                    type: UrlLaunchType.phone)),
            Gap(16),
            _buildAddress(context,
                icon: Assets.telephoneDialSvg,
                data: organizationContactPhone2,
                onTap: () => UrlLauncherHelper.launchURL(
                    data: organizationContactPhone2,
                    type: UrlLaunchType.phone)),
            Gap(16),
            _buildAddress(context,
                icon: Assets.emailSendSvg,
                data: organizationContactEmail,
                onTap: () => UrlLauncherHelper.launchURL(
                    data: organizationContactEmail, type: UrlLaunchType.email)),
            Gap(16),
            Divider(color: Colors.grey),
            Gap(16),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                copyrightText,
              ),
            ),
            Gap(16),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcons(BuildContext context) {
    final list = socialButtonDataList;
    return Row(
      spacing: 16,
      children: List.generate(
          list.length,
          (index) => FooterSocialIconsWidget(
              assets: list[index].iconPath,
              toolTip: list[index].title,
              url: list[index].url)),
    );
  }

  Widget _buildAddress(BuildContext context,
      {required String icon,
      required String data,
      required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            height: Dimens.iconSize20,
            width: Dimens.iconSize20,
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                  context.colorScheme.primary, BlendMode.srcIn),
            ),
          ),
          Gap(20),
          Flexible(child: Text(data)),
        ],
      ),
    );
  }
}
