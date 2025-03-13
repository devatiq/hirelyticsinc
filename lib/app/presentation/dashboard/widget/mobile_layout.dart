import 'package:flutter/widgets.dart';
import 'package:hirelyticsinc/app/presentation/blogs/widgets/mobile/mobile_blogs_section.dart';
import 'package:hirelyticsinc/app/presentation/choose_us/widget/mobile/mobile_why_choose_us_section.dart';
import 'package:hirelyticsinc/app/presentation/home/widget/mobile/mobile_home_section.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../about_us/widget/mobile/mobile_about_us_section.dart';
import '../../contact_us/widget/mobile/mobile_contact_us_section.dart';
import '../../footer/widget/mobile/mobile_footer_section.dart';
import '../../service/widget/mobile/mobile_service_section.dart';

class MobileLayout extends StatelessWidget {
  final ItemScrollController itemScrollController;

  const MobileLayout({super.key, required this.itemScrollController});

  final List<Widget> items = const [
    MobileHomeSection(), // 0 Menu.home
    MobileWhyChooseUsSection(), // 1
    MobileServiceSection(), // 2 Menu.service
    MobileAboutUsSection(), // 3 Menu.about
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
