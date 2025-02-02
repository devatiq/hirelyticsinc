import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
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
              title: Text('Home'),
              onTap: () {
                Scaffold.of(context).closeEndDrawer();
                provider.scrollToIndex(0);
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Scaffold.of(context).closeEndDrawer();
                provider.scrollToIndex(3);
              },
            ),
            ListTile(
              title: Text('Service'),
              onTap: () {
                Scaffold.of(context).closeEndDrawer();
                provider.scrollToIndex(2);
              },
            ),
            ListTile(
              title: Text('Contact'),
              onTap: () {
                Scaffold.of(context).closeEndDrawer();
                provider.scrollToIndex(4);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
