import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hirelyticsinc/core/config/router/routes.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';
import 'package:hirelyticsinc/core/utils/constants/app_constants.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/extension/color_extension.dart';
import 'package:hirelyticsinc/core/utils/helper/common_style.dart';

import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/helper/url_launcher_helper.dart';
import '../../../../../core/utils/style/text_styles.dart';
import '../../../../shared/widget/grey_scale_with_background_widget.dart';
import '../../team_view_model.dart';

class MobileTeamListSingleItem extends StatelessWidget {
  final TeamViewModel item;

  const MobileTeamListSingleItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          boxShadow: CommonStyle.boxShadow(colorOpacity: 0.15),
          borderRadius: BorderRadius.circular(Dimens.borderRadius16)),
      child: Column(
        children: [
          Expanded(
            child: GreyScaleWithBackgroundWidget(child: image),
          ),
          Gap(Dimens.padding16),
          Text(item.name,
              style: AppTextStyles.titleTextStyle(context,
                  fontSize: Dimens.fontSize24)),
          Gap(Dimens.padding8),
          Text(item.designation,
              style: AppTextStyles.subtitleTextStyle(context,
                  fontSize: Dimens.fontSize18)),
          Gap(Dimens.padding8),
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: Dimens.padding16,
            children: List.generate(
              item.socials.length,
              (index) {
                final social = item.socials[index];
                return InkWell(
                  onTap: social.url.trim().isEmpty
                      ? null
                      : () => UrlLauncherHelper.launchURL(
                          data: social.url, type: UrlLaunchType.url),
                  child: Container(
                      padding: const EdgeInsets.all(Dimens.padding8),
                      height: Dimens.iconSize36,
                      width: Dimens.iconSize36,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius:
                              BorderRadius.circular(Dimens.borderRadius6)),
                      child: SvgPicture.asset(
                        social.assetIcon,
                        colorFilter: ColorFilter.mode(
                            AppColors.colorWhite, BlendMode.srcIn),
                      )),
                );
              },
            ),
          ),
          Divider(
            color: AppColors.colorGrey.shade(230),
            indent: Dimens.padding16,
            endIndent: Dimens.padding16,
            height: Dimens.padding16,
          ),
          TextButton(
              onPressed: () {
                context.goNamed(Routes.memberDetails, extra: item);
              },
              style: TextButton.styleFrom(
                  textStyle: AppTextStyles.titleTextStyle(context,
                      fontSize: Dimens.fontSize16)),
              iconAlignment: IconAlignment.end,
              child: Text(viewBioText))
        ],
      ),
    );
  }

  Widget get image {
    if (item.image.source == ImgSource.assets) {
      return Image.asset(item.image.url,
          fit: BoxFit.contain, alignment: Alignment.topCenter);
    } else if (item.image.source == ImgSource.network) {
      return Image.network(
        item.image.url,
        fit: BoxFit.cover,
      );
    }
    return SizedBox.shrink();
  }
}
