import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Color textColor;
  final double elevation;
  final Color backgroundColor;
  final double borderRadius;
  final Function() onPressed;
  final double horizontal;
  final double vertical;
  const AuthButton(
      {super.key,
      required this.text,
      this.textSize=18,
      this.textColor = AppColors.primaryColor,
      this.elevation=8,
      this.backgroundColor =AppColors.whiteColor,
      this.borderRadius=10,
      required this.onPressed,
      this.horizontal=30,
      this.vertical=10,});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: elevation,
            padding: EdgeInsets.symmetric(
              horizontal: horizontal,
              vertical: vertical,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: textSize.sp,
            color: textColor,
          ),
        ));
  }
}
