import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final double borderRadius;
  final double borderWidth;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Color borderColor;
  final Color borderErrorColor;
  final bool filled;
  final Color fillColor;
  final String hint;
  final Color hintColor;
  final double hintSize;
  final String? Function(String?)? validator;
  final bool scurePassword;
  final bool isPassWord;
  final Function()? onPressedSuffix;
  final Color suffixIconColor;
  const AppTextField({
    super.key,
    this.controller,
    this.borderRadius = 10,
    this.borderWidth = 2,
    this.borderColor = AppColors.greyColor,
    this.borderErrorColor = AppColors.redColor,
    this.filled = true,
    this.fillColor = AppColors.whiteColor,
    required this.hint,
    this.hintColor = AppColors.greyColor,
    this.hintSize = 16,
    this.validator,
    this.scurePassword = false,
    this.isPassWord = false,
    this.onPressedSuffix,
    this.suffixIconColor = AppColors.greyColor,
    this.keyboardType,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderErrorColor,
            width: borderWidth,
          ),
        ),
        filled: filled,
        fillColor: fillColor,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: hintSize.sp,
          color: hintColor,
        ),
        suffixIcon: isPassWord
            ? IconButton(
                onPressed: onPressedSuffix,
                icon: Icon(
                    scurePassword ? Icons.visibility : Icons.visibility_off))
            : null,
        suffixIconColor: suffixIconColor,
      ),
      validator: validator,
      obscureText: scurePassword,
    );
  }
}
