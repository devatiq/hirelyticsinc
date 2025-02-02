import 'package:flutter/widgets.dart';
import 'package:hirelyticsinc/app/presentation/choose_us/widgets/mobile/mobile_why_choose_us_section.dart';
import 'package:hirelyticsinc/app/presentation/home/widget/mobile/mobile_home_section.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../about_us/widget/mobile_about_us_section.dart';
import '../../contact_us/widget/mobile/mobile_contact_us_section.dart';
import '../../footer/widget/mobile/mobile_footer_section.dart';
import '../../service/widget/mobile/mobile_service_section.dart';

class MobileLayout extends StatelessWidget {
  final ItemScrollController itemScrollController;

  const MobileLayout({super.key, required this.itemScrollController});

  final List<Widget> items = const [
    MobileHomeSection(),
    MobileWhyChooseUsSection(),
    MobileServiceSection(),
    MobileAboutUsSection(),
    MobileContactUsSection(),
    //others
    MobileFooterSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemCount: items.length,
      itemScrollController: itemScrollController,
      itemBuilder: (context, index) => items[index],
    );
  }
}
