import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../about_us/widget/tablet/tablet_about_us_section.dart';
import '../../blogs/widgets/mobile/mobile_blogs_section.dart';
import '../../choose_us/widget/tablet/tablet_why_choose_us_section.dart';
import '../../contact_us/widget/mobile/mobile_contact_us_section.dart';
import '../../footer/widget/mobile/mobile_footer_section.dart';
import '../../home/widget/mobile/mobile_home_section.dart';
import '../../service/widget/tablet/tablet_service_section.dart';

class TabletLayout extends StatelessWidget {
  final ItemScrollController itemScrollController;
  const TabletLayout({super.key, required this.itemScrollController});

  final List<Widget> items = const [
    MobileHomeSection(), // 0 Menu.home
    TabletWhyChooseUsSection(), // 1
    TabletServiceSection(), // 2 Menu.service
    TabletAboutUsSection(), // 3 Menu.about
    MobileBlogsSection(), // 4
    MobileContactUsSection(), // 5 Menu.contact
    MobileFooterSection(), // 6
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemCount: items.length,
      physics: const ClampingScrollPhysics(),
      itemScrollController: itemScrollController,
      itemBuilder: (context, index) => items[index],
    );
  }
}
