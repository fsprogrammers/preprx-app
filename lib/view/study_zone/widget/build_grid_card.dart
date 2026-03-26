import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_buildtile_icon.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';

Widget buildGridCard(String iconPath, String title) {
  return Container(
    height: 170.h,
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(26.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTealIconBox(iconPath),

        verticalSpacer(height: 16),
        customText(
          text: title,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: AppColors.charcoal,
        ),
      ],
    ),
  );
}
