import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_button.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/view/study_zone/study_zone_flashcards.dart';

Widget buildFlashcard(FlashcardData card) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
          text: card.category,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: AppColors.indigo,
        ),
        verticalSpacer(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: customText(
            text: card.question,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.bodytext,
            textAlign: TextAlign.center,
            maxLine: 3,
          ),
        ),
        verticalSpacer(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: AppColors.teal,
                borderRadius: BorderRadius.circular(10.r),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppImages.hintBulb,
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            horizontalSpacer(width: 12),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: customRichText(
                  textSpans: [
                    TextSpan(
                      text: "Tip: ",
                      style: TextStyle(
                        color: AppColors.teal,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily:
                            'Inter', // Usually matches google fonts if needed
                      ),
                    ),
                    TextSpan(
                      text: card.tip,
                      style: TextStyle(
                        color: AppColors.charcoal,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        verticalSpacer(height: 24),
        Align(
          alignment: Alignment.center,
          child: customButton(
            text: "Show Answer",
            fontSize: 14,
            height: 44, // smaller height for standard pill buttons
            width: 180,
            borderColor: AppColors.teal,
            bgColor: AppColors.teal,
            fontColor: Colors.white,
            borderRadius: 22,
            isCircular: true,
            fontWeight: FontWeight.w400,
            onPressed: () {
              // Logic to show answer
            },
          ),
        ),
      ],
    ),
  );
}
