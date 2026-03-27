import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';

Widget buildStrategyCard({
  required String title,
  required String icon,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(24.r),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
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
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: AppColors.teal,
              borderRadius: BorderRadius.circular(12.r),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              icon,
              width: 24.w,
              height: 24.h,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          verticalSpacer(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: customText(
              text: title,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.charcoal,
              textAlign: TextAlign.center,
              maxLine: 3,
            ),
          ),
        ],
      ),
    ),
  );
}
