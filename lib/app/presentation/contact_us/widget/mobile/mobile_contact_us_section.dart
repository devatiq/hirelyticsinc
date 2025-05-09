import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';

import 'mobile_contact_form_card_widget.dart';
import 'mobile_contact_info_card_widget.dart';

class MobileContactUsSection extends StatelessWidget {
  const MobileContactUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.horizontalSpace),
      //decoration: BoxDecoration(),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(40),
          MobileContactInfoCardWidget(),
          Gap(20),
          MobileContactFormCardWidget(),
          Gap(40),
        ],
      ),
    );
  }
}
