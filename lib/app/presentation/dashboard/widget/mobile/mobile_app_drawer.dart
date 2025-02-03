import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/app/presentation/dashboard/menu.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';

import '../../provider/dashboard_provider.dart';

class MobileAppDrawer extends ConsumerWidget {
  const MobileAppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(dashboardProvider);
    return Drawer(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.horizontalSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Gap(16),
            ListTile(
              title: Text(Menu.home.title),
              onTap: () {
                Scaffold.of(context).closeEndDrawer();
                provider.scrollToIndex(Menu.home.indexValue);
              },
            ),
            ListTile(
              title: Text(Menu.about.title),
              onTap: () {
                Scaffold.of(context).closeEndDrawer();
                provider.scrollToIndex(Menu.about.indexValue);
              },
            ),
            ListTile(
              title: Text(Menu.service.title),
              onTap: () {
                Scaffold.of(context).closeEndDrawer();
                provider.scrollToIndex(Menu.service.indexValue);
              },
            ),
            ListTile(
              title: Text(Menu.contact.title),
              onTap: () {
                Scaffold.of(context).closeEndDrawer();
                provider.scrollToIndex(Menu.contact.indexValue);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
