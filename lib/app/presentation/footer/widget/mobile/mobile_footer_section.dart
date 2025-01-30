import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/extension/context_extension.dart';
import 'package:hirelyticsinc/core/utils/style/text_styles.dart';

import '../../../../../core/utils/constants/assets.dart';
import '../../../../../core/utils/constants/strings.dart';
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
                icon: Icons.location_on, data: organizationContactAddress),
            Gap(16),
            _buildAddress(context,
                icon: Icons.phone, data: organizationContactPhone1),
            Gap(16),
            _buildAddress(context,
                icon: Icons.call, data: organizationContactPhone2),
            Gap(16),
            _buildAddress(context,
                icon: Icons.email, data: organizationContactEmail),
            Gap(16),
            Divider(
              color: Colors.white,
            ),
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

  _buildSocialIcons(BuildContext context) {
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

  _buildAddress(BuildContext context,
      {required IconData icon, required String data}) {
    return Row(
      children: [
        Icon(icon, color: context.colorScheme.primary),
        Gap(20),
        Text(data),
      ],
    );
  }
}
