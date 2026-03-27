import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_button.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_assets.dart';

class StrategyZoneMindsetView extends StatelessWidget {
  const StrategyZoneMindsetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              verticalSpacer(height: 10),

              // Top App Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: customAppBar(
                  isBack: true,
                  isSearch: false,
                  isProfile: true,
                ),
              ),

              verticalSpacer(height: 16),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        // Header Box
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 32.h,
                            horizontal: 8.w,
                          ),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              customText(
                                text: "Test Day Mindset",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 12),
                              customText(
                                text:
                                    "Your final prep! Use these immediate tools to manage stress and panic when the test pressure hits.",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                                maxLine: 4,
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 20),

                        // Card 1: Mind Blanks
                        _buildActionCard(
                          iconPath: AppImages.brain,
                          title: "What to do when your mind blanks",
                          buttonText: "3 steps panic reset",
                          onPressed: () {
                            _showPanicResetDialog(context);
                          },
                        ),

                        verticalSpacer(height: 16),

                        // Card 2: Breathing Reset
                        _buildActionCard(
                          iconPath: AppImages.breathing,
                          title: "90-Second Breathing Reset",
                          buttonText: "90-Second Breathing Reset",
                          onPressed: () {
                            _showBreathingResetDialog(context);
                          },
                        ),

                        verticalSpacer(height: 16),

                        // Card 3: Mindset Moment
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 32.h,
                            horizontal: 24.w,
                          ),
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
                                text: "Mindset Moment",
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: AppColors.indigo,
                              ),
                              verticalSpacer(height: 16),
                              Row(
                                children: [
                                  Container(
                                    width: 42.w,
                                    height: 42.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.teal,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: 28.sp,
                                      ),
                                    ),
                                  ),
                                  horizontalSpacer(width: 16),
                                  Expanded(
                                    child: customText(
                                      text:
                                          "I am calm, capable and ready to succeed",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppColors.indigo,
                                      maxLine: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 80),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBreathingResetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppImages.breathing,
                  width: 250.w,
                  fit: BoxFit.contain,
                ),
                verticalSpacer(height: 32),
                customText(
                  text: "4 sec. Inhale  →  4 sec. Hold  →  4 sec. Exhale",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColors.charcoal,
                  textAlign: TextAlign.center,
                ),
                verticalSpacer(height: 16),
                customText(
                  text: "Repeat for 90 sec.",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.bodytext,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPanicResetDialog(BuildContext context) {
    showDialog(
      context: context,

      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                customText(
                  text: "3 sequential steps to reset panic",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.charcoal,
                  textAlign: TextAlign.center,
                  maxLine: 2,
                ),
                verticalSpacer(height: 24),
                _buildStepItem(
                  step: "Step 1",
                  action: "STOP:",
                  text:
                      " Pause and Close Your Eyes.\nTake one slow, deep breath. Focus only on the air moving in and out for 5 seconds.",
                ),
                verticalSpacer(height: 20),
                _buildStepItem(
                  step: "Step 2",
                  action: "Read:",
                  text:
                      " Reread the Stem Only.\nDo not look at the answers. Reread only the question stem to identify the patient, Situation, and Core Problem.",
                ),
                verticalSpacer(height: 20),
                _buildStepItem(
                  step: "Step 3",
                  action: "FRAMEWORK:",
                  text:
                      " Pick Your Priority.\nApply the best framework: ABCs? Maslow's? Assess vs. Intervene? Use this framework to narrow your options.",
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStepItem({
    required String step,
    required String action,
    required String text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
          text: step,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: AppColors.charcoal,
        ),
        verticalSpacer(height: 8),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14.sp,
              color: AppColors.bodytext,
              height: 1.4,
            ),
            children: [
              if (action.isNotEmpty)
                TextSpan(
                  text: action,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.teal,
                  ),
                ),
              TextSpan(
                text: text,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required String iconPath,
    required String title,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
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
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 42.w,
              height: 42.w,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.teal,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SvgPicture.asset(
                iconPath,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          verticalSpacer(height: 12),
          customText(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.indigo,
            textAlign: TextAlign.center,
          ),
          verticalSpacer(height: 16),
          customButton(
            text: buttonText,
            bgColor: AppColors.teal,
            borderColor: AppColors.teal,
            fontColor: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 40,
            borderRadius: 20,
            isCircular: false,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
