import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/utils/app_assets.dart';

Widget customTopLogo() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12.r),
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.all(4.sp),
      child: Image.asset(
        AppImages.splash,
        fit: BoxFit.cover,
        width: 75.w,
        height: 85.h,
      ),
    ),
  );
}
