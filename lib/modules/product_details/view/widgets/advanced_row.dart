import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class AdvancedRow extends StatelessWidget {
  final String text;
  final String value;
  const AdvancedRow({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(text,textAlign: TextAlign.start, style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),),
              Text(
              value,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

              ],
            );
  }
}