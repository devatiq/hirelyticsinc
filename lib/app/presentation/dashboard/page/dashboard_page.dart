import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hirelyticsinc/app/presentation/dashboard/widget/adaptive_layout_widget.dart';
import 'package:hirelyticsinc/app/presentation/dashboard/widget/app_drawer.dart';
import 'package:hirelyticsinc/app/presentation/dashboard/widget/mobile_layout.dart';
import 'package:hirelyticsinc/app/presentation/dashboard/widget/tablet_layout.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';
import 'package:hirelyticsinc/core/utils/constants/app_constants.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/extension/number_extension.dart';

import '../../../../core/utils/constants/assets.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildMobileAppBar(context),
        endDrawer: AppDrawer(),
        body: AdaptiveLayoutWidget(
            mobileLayout: (context) => const MobileLayout(),
            tabletLayout: (context) => const TabletLayout()));
  }

  PreferredSizeWidget _buildMobileAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: Dimens.appBarHeight,
      backgroundColor: AppColors.kColorGradiant1,
      surfaceTintColor: Theme.of(context).colorScheme.secondary,
      title: Image.asset(Assets.logo),
      actions: [
        Builder(
          builder: (context) {
            return IconButton(
              icon: SvgPicture.asset(
                Assets.navMenuSvg,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor, BlendMode.srcIn),
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            );
          },
        ),
        8.gap,
      ],
    );
  }
}
