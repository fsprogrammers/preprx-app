import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_button.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';

class StrategyZoneFlaggedQuestionsView extends StatelessWidget {
  const StrategyZoneFlaggedQuestionsView({super.key});

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
                                text: "Flagged questions list\nfor review",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                              verticalSpacer(height: 12),
                              customText(
                                text: "Here are all your flagged questions",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 24),

                        // List of Flagged Questions
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: _buildFlaggedQuestionCard(
                                drillName: "Drill/ Q#7",
                                category: "SATA Bootcamp",
                                snippet:
                                    "A patient 2 days post-op reports pain rating 7/10. Which nursing action is most appropri...",
                              ),
                            );
                          },
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

  Widget _buildFlaggedQuestionCard({
    required String drillName,
    required String category,
    required String snippet,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customText(
                text: drillName,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.indigo,
              ),
              customText(
                text: category,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.indigo,
              ),
            ],
          ),
          verticalSpacer(height: 16),
          customText(
            text: snippet,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.bodytext,
            maxLine: 2,
          ),
          verticalSpacer(height: 20),
          Row(
            children: [
              Expanded(
                child: customButton(
                  text: "Review Question",
                  bgColor: AppColors.gold,
                  borderColor: AppColors.gold,
                  fontColor: AppColors.charcoal,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 40,
                  borderRadius: 20,
                  isCircular: false,
                  onPressed: () {},
                ),
              ),
              horizontalSpacer(width: 12),
              Expanded(
                child: customButton(
                  text: "Unflag question",
                  bgColor: AppColors.teal,
                  borderColor: AppColors.teal,
                  fontColor: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 40,
                  borderRadius: 20,
                  isCircular: false,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
