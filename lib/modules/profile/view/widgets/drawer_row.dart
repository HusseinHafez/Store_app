import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_constants.dart';

import '../../../../core/utils/app_colors.dart';

class DrawerRow extends StatelessWidget {
  final String text;
  final IconData icon;
  const DrawerRow({super.key, required this.text, required this.icon,});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal:AppConstants.defaultPadding),
      child: Material(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
                                children: [
                                  Icon(icon,size: 25.w,color: AppColors.whiteColor,),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    text,
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
        ),
      ),
    );
  }
}