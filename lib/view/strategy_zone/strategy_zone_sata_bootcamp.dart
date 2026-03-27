import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_button.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';

class StrategyZoneSataBootcampView extends StatelessWidget {
  const StrategyZoneSataBootcampView({super.key});

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
                            horizontal: 16.w,
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
                                text: "Select-All-That-Apply\n(SATA) Bootcamp",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                              verticalSpacer(height: 12),
                              customText(
                                text:
                                    "Master the most difficult question format! These rules break down the NCLEX SATA challenge.",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                                maxLine: 4,
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 16),

                        // Strategy 1
                        _buildStrategySection(
                          title: "Strategy 1: The True/False Test",
                          children: [
                            _buildRuleItem(
                              rule: "Rule 1:",
                              title: "Think True/False, not \"Which ones?\"",
                              label: "Mentally ask: ",
                              text:
                                  "Is this option true for this patient?\" Treat each option as an independent question.",
                            ),
                            verticalSpacer(height: 24),
                            _buildRuleItem(
                              rule: "Rule 2:",
                              title: "Each Option Stands Alone",
                              text:
                                  "Do not look for patterns between options. One correct answer does not influence another.",
                            ),
                          ],
                        ),

                        verticalSpacer(height: 16),

                        // Strategy 2
                        _buildStrategySection(
                          title: "Strategy 2: The Rule of Two & Five",
                          children: [
                            _buildRuleItem(
                              rule: "Rule 3:",
                              title: "No Half-Credit Thinking.",
                              text:
                                  "If you are even slightly unsure about an option, eliminate it. An incorrect selection fails the entire question.",
                            ),
                            verticalSpacer(height: 24),
                            _buildRuleItem(
                              rule: "Rule 4:",
                              title: "Expected Answer Range",
                              text:
                                  "The vast majority of correct answers per SATA question is **2 to 5**. If you selected 1 or 6/7, reconsider.",
                            ),
                          ],
                        ),

                        verticalSpacer(height: 16),

                        // Strategy 3
                        _buildStrategySection(
                          title: "Strategy 3: Strategic Application",
                          children: [
                            _buildRuleItem(
                              rule: "Rule 5:",
                              title: "Always Reread the Stem",
                              text:
                                  "Before finalizing, reread the stem to ensure every selected option directly relates back to the client's core problem.",
                            ),
                            verticalSpacer(height: 24),
                            _buildRuleItem(
                              rule: "Rule 6:",
                              title: "Check Your Frameworks",
                              text:
                                  "Use the frameworks to prioritize your selected actions/assessments, ensuring the most important ones are included.",
                            ),
                          ],
                        ),

                        verticalSpacer(height: 32),

                        // Action Button
                        customButton(
                          text: "Start SATA Practice Drill",
                          bgColor: AppColors.gold,
                          borderColor: AppColors.gold,
                          fontColor: AppColors.charcoal,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 52,
                          borderRadius: 20,
                          isCircular: false,
                          onPressed: () {},
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

  Widget _buildStrategySection({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
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
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.charcoal,
          ),
          verticalSpacer(height: 24),
          ...children,
        ],
      ),
    );
  }

  Widget _buildRuleItem({
    required String rule,
    required String title,
    String? label,
    required String text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
          text: rule,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: AppColors.indigo,
        ),
        verticalSpacer(height: 8),
        customText(
          text: title,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.bodytext,
        ),
        verticalSpacer(height: 4),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14.sp,
              color: AppColors.bodytext,
              height: 1.4,
            ),
            children: [
              if (label != null)
                TextSpan(
                  text: label,
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
}
