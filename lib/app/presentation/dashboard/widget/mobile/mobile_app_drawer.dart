import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/app/presentation/dashboard/menu.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/extension/context_extension.dart';

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
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.horizontalSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(16),
                  TextButton.icon(
                    onPressed: () => closeDrawer(context),
                    icon: Icon(Icons.adaptive.arrow_back),
                    label: Text('Close'),
                  ),
                  ListTile(
                    title: Text(Menu.home.title),
                    onTap: () =>
                        closeAndNavigate(context, ref, Menu.home.indexValue),
                  ),
                  ListTile(
                    title: Text(Menu.about.title),
                    onTap: () =>
                        closeAndNavigate(context, ref, Menu.about.indexValue),
                  ),
                  ListTile(
                    title: Text(Menu.service.title),
                    onTap: () =>
                        closeAndNavigate(context, ref, Menu.service.indexValue),
                  ),
                  ListTile(
                    title: Text(Menu.contact.title),
                    onTap: () =>
                        closeAndNavigate(context, ref, Menu.contact.indexValue),
                  ),
                ],
              ),
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

/*class MobileAppDrawer extends ConsumerStatefulWidget {
  const MobileAppDrawer({super.key});

  @override
  ConsumerState<MobileAppDrawer> createState() => _MobileAppDrawerState();
}

class _MobileAppDrawerState extends ConsumerState<MobileAppDrawer> {
  @override
  void initState() {
    super.initState();
   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      bottom: false,
      child: Drawer(
          width: width * 0.66,
          child: SafeArea(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: Dimens.horizontalSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(16),
                  TextButton.icon(
                    onPressed: () => closeDrawer(context),
                    icon: Icon(Icons.adaptive.arrow_back),
                    label: Text('Close'),
                  ),
                  // IconButton(
                  //   icon: const Icon(Icons.close),
                  //   padding: EdgeInsets.zero,
                  //   style: IconButton.styleFrom(
                  //       padding: EdgeInsets.zero,
                  //       backgroundColor: context.colorScheme.primary,
                  //       foregroundColor: context.colorScheme.onPrimary,
                  //       tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  //   onPressed: () => closeDrawer(context),
                  // ),
                  ListTile(
                    title: Text(Menu.home.title),
                    onTap: () =>
                        closeAndNavigate(context, ref, Menu.home.indexValue),
                  ),
                  ListTile(
                    title: Text(Menu.about.title),
                    onTap: () =>
                        closeAndNavigate(context, ref, Menu.about.indexValue),
                  ),
                  ListTile(
                    title: Text(Menu.service.title),
                    onTap: () =>
                        closeAndNavigate(context, ref, Menu.service.indexValue),
                  ),
                  ListTile(
                    title: Text(Menu.contact.title),
                    onTap: () =>
                        closeAndNavigate(context, ref, Menu.contact.indexValue),
                  ),
                ],
              ),
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
}*/
