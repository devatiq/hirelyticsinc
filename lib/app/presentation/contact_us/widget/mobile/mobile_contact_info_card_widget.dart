import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/helper/url_launcher_helper.dart';

import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/style/text_styles.dart';

class MobileContactInfoCardWidget extends StatelessWidget {
  const MobileContactInfoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.padding16),
      decoration: BoxDecoration(
          gradient: AppColors.kGradiantContact,
          borderRadius: BorderRadius.circular(Dimens.borderRadius16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(contactUsText,
              style: AppTextStyles.titleTextStyle(context,
                  fontSize: Dimens.fontSize25, color: AppColors.colorWhite)),
          Gap(Dimens.padding40),
          _buildContactInfo(context,
              title: emailText,
              data: organizationContactEmail,
              icon: Icons.email,
              onTap: () => UrlLauncherHelper.launchURL(
                  data: organizationContactEmail, type: UrlLaunchType.email)),
          _divider(),
          _buildContactInfo(context,
              title: phoneText,
              data: organizationContactPhone1,
              icon: Icons.phone,
              onTap: () => UrlLauncherHelper.launchURL(
                  data: organizationContactPhone1, type: UrlLaunchType.phone)),
          _divider(),
          _buildContactInfo(context,
              title: locationText,
              data: organizationContactAddress,
              icon: Icons.location_on,
              onTap: () => UrlLauncherHelper.launchURL(
                  data: organizationLocationMapUrl, type: UrlLaunchType.url)),
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(height: Dimens.padding48, color: Colors.white);
  }

  Widget _buildContactInfo(BuildContext context,
      {required IconData icon,
      required String title,
      required String data,
      required void Function() onTap}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(Dimens.padding8),
          decoration: BoxDecoration(
            color: AppColors.colorWhite,
            borderRadius: BorderRadius.circular(Dimens.borderRadius8),
          ),
          child: Icon(
            icon,
            size: 32,
            color: AppColors.colorBlack,
          ),
        ),
        Gap(Dimens.padding16),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: Dimens.fontSize14,
                  color: AppColors.colorWhite,
                ),
              ),
              InkWell(
                onTap: onTap,
                child: Text(
                  data,
                  style: TextStyle(
                    fontSize: Dimens.fontSize16,
                    color: AppColors.colorWhite,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
