import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/app/presentation/contact_us/widget/custom_form_text_field.dart';
import 'package:hirelyticsinc/core/utils/constants/strings.dart';
import 'package:hirelyticsinc/core/utils/extension/context_extension.dart';
import 'package:hirelyticsinc/core/utils/helper/common_style.dart';

import '../../../../../core/utils/constants/dimens.dart';
import '../../../../../core/utils/style/text_styles.dart';

class MobileContactFormCardWidget extends StatelessWidget {
  const MobileContactFormCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.padding16),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.borderRadius16),
          boxShadow: CommonStyle.boxShadow(colorOpacity: 0.05)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Send Us A Message',
              style: AppTextStyles.titleTextStyle(context, fontSize: 25)),
          Gap(40),
          ..._buildTextFields(context),
          Gap(40),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: Dimens.padding16),
              decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.circular(Dimens.borderRadius12)),
              child: Text(
                submitFormButtonText,
                style: TextStyle(
                  color: context.colorScheme.onPrimary,
                  fontSize: Dimens.fontSize16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildTextFields(BuildContext context) {
    final formTitleContentGap = const Gap(Dimens.padding4);
    final formEachItemGap = const Gap(Dimens.padding16);

    return [
      //first name
      _textFieldTitle(context, firstNameText),
      formTitleContentGap,
      const CustomFormTextField(),
      formEachItemGap,

      //last name
      _textFieldTitle(context, lastNameText),
      formTitleContentGap,
      const CustomFormTextField(),
      formEachItemGap,

      //email
      _textFieldTitle(context, emailText),
      formTitleContentGap,
      const CustomFormTextField(),
      formEachItemGap,

      // message
      _textFieldTitle(context, messageText),
      formTitleContentGap,
      const CustomFormTextField(maxLines: 6),
    ];
  }

  _textFieldTitle(BuildContext context, String title) {
    return Text(title,
        style: AppTextStyles.titleTextStyle(
          context,
          fontWeight: FontWeight.normal,
          fontSize: Dimens.fontSize16,
        ));
  }
}
