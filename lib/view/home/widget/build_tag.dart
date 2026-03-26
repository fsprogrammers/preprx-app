import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';

Widget buildTag(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    decoration: BoxDecoration(
      color: const Color(0xFFF2EEF7),
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: customText(
      text: text,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColors.bodytext,
    ),
  );
}
