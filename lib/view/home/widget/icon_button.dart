import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:preprx/utils/app_colors.dart';

Widget iconButton({
  required String icon,
  required VoidCallback onPressed,
  double? width,
  double? height,
  double? containerWidth,
  double? containerHeight,
}) {
  return InkWell(
    onTap: onPressed,
    borderRadius: BorderRadius.circular(12.r),
    child: Container(
      width: containerWidth ?? 44.w,
      height: containerHeight ?? 44.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        icon,
        color: AppColors.teal,
        width: width ?? 24.w,
        height: height ?? 24.h,
      ),
    ),
  );
}
