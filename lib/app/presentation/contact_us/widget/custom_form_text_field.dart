import 'package:flutter/material.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';

class CustomFormTextField extends StatelessWidget {
  final int? maxLines;
  final TextEditingController? controller;

  const CustomFormTextField({super.key, this.maxLines, this.controller});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimens.borderRadius16),
      borderSide: BorderSide.none,
    );
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          border: border,
          fillColor: AppColors.colorTextFieldBackground,
          filled: true),
    );
  }
}
