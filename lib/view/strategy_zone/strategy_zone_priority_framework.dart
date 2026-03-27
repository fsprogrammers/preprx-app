import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';

class StrategyZonePriorityFrameworkView extends StatelessWidget {
  const StrategyZonePriorityFrameworkView({super.key});

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
                            vertical: 24.h,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              customText(
                                text: "Priority frameworks",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 12),
                              customText(
                                text:
                                    "Use these formulas to quickly rank patient needs and choose the best action",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 24),

                        // List of framework items
                        _buildFrameworkItem(
                          iconPath: AppImages.lungs,
                          title: "ABCs ( Airway, Breathing, Circulation)",
                          description:
                              "Choose the option that protects airway first, supports breathing second, and stabilizes circulation last when deciding between interventions.",
                        ),
                        verticalSpacer(height: 16),

                        _buildFrameworkItem(
                          iconPath: AppImages.pyramids,
                          title: "Maslow's Hierarchy",
                          description:
                              "Pick the answer that meets basic physiological needs before psychological, social, or self-fulfillment needs.",
                        ),
                        verticalSpacer(height: 16),

                        _buildFrameworkItem(
                          iconPath: AppImages.process,
                          title: "ADPIE Nursing Process",
                          description:
                              "Select the response that keeps you in the correct step—usually assess first—before jumping to implementation",
                        ),
                        verticalSpacer(height: 16),

                        _buildFrameworkItem(
                          iconPath: AppImages
                              .priorityframe, // Matches safety icon from mockup
                          title: "Safety First (least harmful action)",
                          description:
                              "Go with the choice that prevents the most harm, protects the patient, and reduces immediate risk before anything else.",
                        ),

                        // Bottom padding
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

  Widget _buildFrameworkItem({
    required String iconPath,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
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
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: AppColors.teal,
              borderRadius: BorderRadius.circular(10.r),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              iconPath,
              width: 24.w,
              height: 24.h,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          verticalSpacer(height: 16),
          customText(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.charcoal,
          ),
          verticalSpacer(height: 8),
          customText(
            text: description,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.bodytext,
            maxLine: 5,
          ),
        ],
      ),
    );
  }
}
