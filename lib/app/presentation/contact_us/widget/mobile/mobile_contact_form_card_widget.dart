import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/app/presentation/contact_us/provider/form_submit_provider.dart';
import 'package:hirelyticsinc/app/presentation/contact_us/widget/custom_form_text_field.dart';
import 'package:hirelyticsinc/core/utils/constants/strings.dart';
import 'package:hirelyticsinc/core/utils/extension/context_extension.dart';
import 'package:hirelyticsinc/core/utils/helper/common_style.dart';
import 'package:hirelyticsinc/core/utils/validator/field_validators.dart';

import '../../../../../core/utils/constants/dimens.dart';
import '../../../../../core/utils/style/text_styles.dart';

class MobileContactFormCardWidget extends ConsumerStatefulWidget {
  const MobileContactFormCardWidget({super.key});

  @override
  ConsumerState<MobileContactFormCardWidget> createState() =>
      _MobileContactFormCardWidgetState();
}

class _MobileContactFormCardWidgetState
    extends ConsumerState<MobileContactFormCardWidget> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _messageController;

  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

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
    final formState = ref.watch(formSubmitProvider);

    return Container(
      padding: EdgeInsets.all(Dimens.padding16),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.borderRadius16),
          boxShadow: CommonStyle.boxShadow(colorOpacity: 0.10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(sendUsAMessageText,
              style: AppTextStyles.titleTextStyle(context, fontSize: 25)),
          Gap(40),
          _buildForms(context),
          Gap(40),
          formState.isLoading
              ? const Center(child: CircularProgressIndicator())
              : InkWell(
                  onTap: () {
                    _submitForm(context);
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: Dimens.padding16),
                    decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius:
                            BorderRadius.circular(Dimens.borderRadius12)),
                    child: Text(
                      submitButtonText,
                      style: TextStyle(
                        color: context.colorScheme.onPrimary,
                        fontSize: Dimens.fontSize16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
          const Gap(20),
          formState.when(
            data: (message) {
              _firstNameController.clear();
              _lastNameController.clear();
              _emailController.clear();
              _phoneController.clear();
              _messageController.clear();

              return message.isNotEmpty
                  ? Html(
                      data:
                          '<span style = "text-align:center;color:green;font-size:12px">$message</span>',
                    )
                  : SizedBox.shrink();
            },
            loading: () => SizedBox.shrink(),
            error: (error, _) => Html(
              data:
                  '<div style = "text-align:center;align:center; color:red;font-size:12px">${error.toString()}</div>',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForms(BuildContext context) {
    final formTitleContentGap = const Gap(Dimens.padding4);
    final formEachItemGap = const Gap(Dimens.padding16);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //first name
                  _textFieldTitle(context, firstNameText),
                  formTitleContentGap,
                  CustomFormTextField(
                    controller: _firstNameController,
                    validator: (v) =>
                        FieldValidators.customEmptyOrNullValidator!(v,
                            fieldName: firstNameText),
                  ),
                  formEachItemGap,
                ],
              )),
              formEachItemGap,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //last name
                  _textFieldTitle(context, lastNameText),
                  formTitleContentGap,
                  CustomFormTextField(
                    controller: _lastNameController,
                    validator: (v) =>
                        FieldValidators.customEmptyOrNullValidator!(v,
                            fieldName: lastNameText),
                  ),
                  formEachItemGap,
                ],
              ))
            ],
          ),

          //email
          _textFieldTitle(context, emailText),
          formTitleContentGap,
          CustomFormTextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (v) => FieldValidators.emailValidator!(v),
          ),
          formEachItemGap,

          //phone
          _textFieldTitle(context, phoneText),
          formTitleContentGap,
          CustomFormTextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            validator: (v) => FieldValidators.customEmptyOrNullValidator!(v,
                fieldName: phoneText),
          ),
          formEachItemGap,

          // message
          _textFieldTitle(context, messageText),
          formTitleContentGap,
          CustomFormTextField(
            maxLines: 6,
            controller: _messageController,
            validator: (v) => FieldValidators.customEmptyOrNullValidator!(v,
                fieldName: messageText),
          ),
        ],
      ),
    );
  }

  Widget _textFieldTitle(BuildContext context, String title) {
    return Text(title,
        style: AppTextStyles.titleTextStyle(
          context,
          fontWeight: FontWeight.normal,
          fontSize: Dimens.fontSize16,
        ));
  }

  void _submitForm(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final notifier = ref.read(formSubmitProvider.notifier);

    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;
    final message = _messageController.text;

    notifier.submitForm(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      message: message,
    );
  }
}
