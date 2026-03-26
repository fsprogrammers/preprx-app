
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_text.dart';

Widget buildTiltedContainer(String title, Color color) {
    return Container(
      width: 281.w,
      height: 59.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(35.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ]
      ),
      child: Center(
        child: customText(
          text: title,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
