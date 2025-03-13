import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/app/domain/entity/blog_entity.dart';
import 'package:hirelyticsinc/core/utils/extension/color_extension.dart';
import 'package:hirelyticsinc/core/utils/helper/url_launcher_helper.dart';

import '../../../../../core/utils/constants/dimens.dart';
import '../../../../../core/utils/helper/common_style.dart';
import '../../../../../core/utils/style/text_styles.dart';

class MobileBlogSingleItem extends StatelessWidget {
  final BlogEntity item;

  const MobileBlogSingleItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.link == null
          ? null
          : () {
              UrlLauncherHelper.launchURL(
                  data: item.link!, type: UrlLaunchType.url);
            },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.borderRadius10),
            boxShadow: CommonStyle.boxShadow()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              item.featuredImage ?? '',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.padding8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title ?? '',
                    style: AppTextStyles.titleTextStyle(context,
                        fontSize: Dimens.fontSize16,
                        fontWeight: FontWeight.bold),
                  ),
                  const Gap(Dimens.padding8),
                  Wrap(
                    children: List.generate(
                        item.category.length,
                        (i) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Dimens.padding8),
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .shade(220),
                                  borderRadius: BorderRadius.circular(
                                      Dimens.borderRadius10)),
                              child: Text(
                                item.category[i],
                                style: AppTextStyles.subtitleTextStyle(context,
                                    fontSize: Dimens.fontSize12,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                            )),
                  ),
                  const Gap(Dimens.padding8),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
