import 'package:flutter/material.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';

class CustomFormTextField extends StatelessWidget {
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  final String? Function(String?)? validator;

  const CustomFormTextField(
      {super.key,
      this.maxLines,
      this.controller,
      this.validator,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimens.borderRadius16),
      borderSide: BorderSide.none,
    );
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          isDense: true,
          border: border,
          fillColor: AppColors.colorTextFieldBackground,
          filled: true),
    );
  }
}
