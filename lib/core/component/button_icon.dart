import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AdvancedButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final Color textColor;
  final double textSize;
  final Function() onPressed;
  final double elevation;
  final Color backgroundColor;
  final double horizontal;
  final double vertical;
  final double borderRadius;

  const AdvancedButton(
      {super.key,
      required this.icon,
      this.iconColor=AppColors.primaryColor,
      required this.text,
      this.textColor=AppColors.primaryColor,
      this.textSize=16,
      required this.onPressed,
      this.elevation=8,
      this.backgroundColor=AppColors.whiteColor,
      this.horizontal=30,
      this.vertical=10,
      this.borderRadius=10,
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        color: iconColor,
      ),
      label: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: textSize,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor: backgroundColor,
        
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
