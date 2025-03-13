import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/app/presentation/dashboard/menu.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';

import '../../provider/dashboard_provider.dart';

class MobileAppDrawer extends ConsumerWidget {
  const MobileAppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      bottom: false,
      child: Drawer(
          width: width * 0.66,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.horizontalSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(16),
                TextButton.icon(
                  onPressed: () => closeDrawer(context),
                  icon: Icon(Icons.adaptive.arrow_back),
                  label: const Text('Close'),
                ),
                ListTile(
                  title: Text(Menu.home.title),
                  onTap: () =>
                      closeAndNavigate(context, ref, Menu.home.indexValue),
                ),
                ListTile(
                  title: Text(Menu.service.title),
                  onTap: () =>
                      closeAndNavigate(context, ref, Menu.service.indexValue),
                ),
                ListTile(
                  title: Text(Menu.about.title),
                  onTap: () =>
                      closeAndNavigate(context, ref, Menu.about.indexValue),
                ),
                ListTile(
                  title: Text(Menu.contact.title),
                  onTap: () =>
                      closeAndNavigate(context, ref, Menu.contact.indexValue),
                ),
              ],
            ),
          )),
    );
  }

  void closeAndNavigate(BuildContext context, WidgetRef ref, int index) {
    closeDrawer(context);
    final provider = ref.read(dashboardProvider);
    provider.scrollToIndex(index);
  }

  void closeDrawer(BuildContext context) {
    Scaffold.of(context).closeEndDrawer();
  }
}
