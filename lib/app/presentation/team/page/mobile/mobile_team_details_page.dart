import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirelyticsinc/app/presentation/footer/widget/mobile/mobile_footer_section.dart';
import 'package:hirelyticsinc/app/presentation/team/team_view_model.dart';
import 'package:hirelyticsinc/app/shared/widget/grey_scale_with_background_widget.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';

import '../../../../../core/config/theme/app_colors.dart';
import '../../../../../core/utils/helper/url_launcher_helper.dart';
import '../../../../../core/utils/style/text_styles.dart';

class MobileTeamDetailsPage extends StatelessWidget {
  final TeamViewModel model;

  const MobileTeamDetailsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.horizontalSpace,
                    vertical: Dimens.verticalSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimens.borderRadius10),
                        child: GreyScaleWithBackgroundWidget(child: image)),
                    const Gap(Dimens.padding16),
                    Text(model.name,
                        style: AppTextStyles.titleTextStyle(context,
                            fontSize: Dimens.fontSize24)),
                    const Gap(Dimens.padding16),
                    Text(model.designation,
                        style: AppTextStyles.subtitleTextStyle(context,
                            fontSize: Dimens.fontSize18)),
                    const Gap(Dimens.padding16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: Dimens.padding16,
                      children: List.generate(
                        model.socials.length,
                        (index) {
                          final social = model.socials[index];
                          return InkWell(
                            onTap: social.url.trim().isEmpty
                                ? null
                                : () => UrlLauncherHelper.launchURL(
                                    data: social.url,
                                    type: UrlLaunchType.url),
                            child: Container(
                                padding:
                                    const EdgeInsets.all(Dimens.padding8),
                                height: Dimens.iconSize36,
                                width: Dimens.iconSize36,
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary,
                                    borderRadius: BorderRadius.circular(
                                        Dimens.borderRadius6)),
                                child: SvgPicture.asset(
                                  social.assetIcon,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.colorWhite, BlendMode.srcIn),
                                )),
                          );
                        },
                      ),
                    ),
                    const Gap(Dimens.padding16),
                    Text(
                      model.details,
                      style: AppTextStyles.subtitleTextStyle(context,
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          fontSize: Dimens.fontSize14),
                    ),
                    const Gap(Dimens.padding16),
                  ],
                ),
              ),
              const MobileFooterSection()
            ],
          ),
        ),
      ),
    );
  }

  Widget get image {
    if (model.image.source == ImgSource.assets) {
      return Image.asset(
        model.image.url,
        fit: BoxFit.fill,
      );
    } else if (model.image.source == ImgSource.network) {
      return Image.network(
        model.image.url,
        fit: BoxFit.fill,
      );
    }
    return const SizedBox.shrink();
  }
}
