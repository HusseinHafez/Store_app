import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_colors.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final Function() onTap;
  final IconData icon;
  const DrawerListTile(
      {super.key,
      required this.title,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minLeadingWidth: 0,
      leading: Icon(
        icon,
        color: AppColors.whiteColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.whiteColor,
        size: 16.w,
      ),
    );
  }
}
