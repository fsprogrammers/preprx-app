import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/utils/app_colors.dart';

Widget buildTealIconBox(String icon, {Color color = AppColors.teal}) {
  return Container(
    width: 44.w,
    height: 44.h,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(12.r),
    ),
    alignment: Alignment.center,
    child: SvgPicture.asset(icon, width: 24.w, height: 24.h),
  );
}
