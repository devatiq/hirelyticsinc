import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/app/presentation/contact_us/widget/custom_form_text_field.dart';
import 'package:hirelyticsinc/core/utils/constants/strings.dart';
import 'package:hirelyticsinc/core/utils/extension/context_extension.dart';
import 'package:hirelyticsinc/core/utils/helper/common_style.dart';

import '../../../../../core/utils/constants/dimens.dart';
import '../../../../../core/utils/style/text_styles.dart';

class MobileContactFormCardWidget extends StatefulWidget {
  const MobileContactFormCardWidget({super.key});

  @override
  State<MobileContactFormCardWidget> createState() =>
      _MobileContactFormCardWidgetState();
}

class _MobileContactFormCardWidgetState
    extends State<MobileContactFormCardWidget> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _messageController;

  @override
  void initState() {
    super.initState();

    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

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
            onTap: () {
              _submitForm(context);
            },
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
      CustomFormTextField(controller: _firstNameController),
      formEachItemGap,

      //last name
      _textFieldTitle(context, lastNameText),
      formTitleContentGap,
      CustomFormTextField(controller: _lastNameController),
      formEachItemGap,

      //email
      _textFieldTitle(context, emailText),
      formTitleContentGap,
      CustomFormTextField(controller: _emailController),
      formEachItemGap,

      //phone
      _textFieldTitle(context, phoneText),
      formTitleContentGap,
      CustomFormTextField(controller: _phoneController),
      formEachItemGap,

      // message
      _textFieldTitle(context, messageText),
      formTitleContentGap,
      CustomFormTextField(maxLines: 6, controller: _messageController),
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

  void _submitForm(BuildContext context) {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;
    final message = _messageController.text;

  }
}
