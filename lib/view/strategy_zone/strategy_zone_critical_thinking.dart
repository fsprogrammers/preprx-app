import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_button.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_routes.dart';

class StrategyZoneCriticalThinkingView extends StatefulWidget {
  const StrategyZoneCriticalThinkingView({super.key});

  @override
  State<StrategyZoneCriticalThinkingView> createState() =>
      _StrategyZoneCriticalThinkingViewState();
}

class _StrategyZoneCriticalThinkingViewState
    extends State<StrategyZoneCriticalThinkingView> {
  int? _selectedOption;
  bool _showRationale = false;

  final List<String> _options = [
    "Position the client in high Fowler's",
    "Encourage increased fluid intake",
    "Administer PRN cough suppressant",
    "Provide a high-calorie meal",
  ];

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
                                text: "Critical Thinking Drills",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 12),
                              customText(
                                text:
                                    "Focus on the strategy, not just the content. Apply your frameworks and elimination rules.",
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

                        // Question Box
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 24.h,
                            horizontal: 20.w,
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
                            children: [
                              customText(
                                text: "Q1/15",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.indigo,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 16),
                              customText(
                                text:
                                    "Choose the answer that shows Assessment before Intervention",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                                maxLine: 3,
                              ),
                              verticalSpacer(height: 16),
                              customText(
                                text:
                                    "A patient 2 days post-op reports pain rating 7/10. Which nursing action is most appropriate?",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                                maxLine: 4,
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 24),

                        // Options
                        ...List.generate(_options.length, (index) {
                          String label = String.fromCharCode(65 + index);
                          bool isSelected = _selectedOption == index;
                          bool isCorrect =
                              index == 0; // Assuming A is correct for demo

                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: _buildOption(
                              label: label,
                              text: _options[index],
                              isSelected: isSelected,
                              isCorrect: isCorrect && _showRationale,
                              onTap: () {
                                setState(() {
                                  _selectedOption = index;
                                  _showRationale = true;
                                });
                              },
                            ),
                          );
                        }),

                        if (_showRationale) ...[
                          verticalSpacer(height: 24),
                          // Rationale Box
                          Container(
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
                                customText(
                                  text: "Rationale",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.magenta,
                                ),
                                verticalSpacer(height: 12),
                                customText(
                                  text: "Why this answer is correct",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.charcoal,
                                ),
                                verticalSpacer(height: 8),
                                customText(
                                  text:
                                      "High Fowler's improves lung expansion and reduces work of breathing",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColors.bodytext,
                                  maxLine: 3,
                                ),
                                verticalSpacer(height: 24),
                                customText(
                                  text: "Why this answers are incorrect",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.charcoal,
                                ),
                                verticalSpacer(height: 12),
                                _buildBulletPoint(
                                  "Increasing fluids may increase mucus",
                                ),
                                _buildBulletPoint(
                                  "Cough suppressant reduces airway clearance",
                                ),
                                _buildBulletPoint(
                                  "High-calorie meal increases O2 demand",
                                ),
                              ],
                            ),
                          ),
                          verticalSpacer(height: 24),
                          customButton(
                            text: "Next Question",
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
                          verticalSpacer(height: 16),
                          customButton(
                            text: "Flag for Review",
                            bgColor: AppColors.teal,
                            borderColor: AppColors.teal,
                            fontColor: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            height: 52,
                            borderRadius: 20,
                            isCircular: false,
                            onPressed: () {
                              goRouter.push(
                                AppRoutes.strategyZoneFlaggedQuestions,
                              );
                            },
                          ),
                        ],

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

  Widget _buildOption({
    required String label,
    required String text,
    required bool isSelected,
    required bool isCorrect,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: isCorrect ? AppColors.teal : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            customText(
              text: label,
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: AppColors.teal,
            ),
            horizontalSpacer(width: 12),
            Expanded(
              child: customText(
                text: text,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.bodytext,
                maxLine: 2,
              ),
            ),
            if (isCorrect) ...[
              horizontalSpacer(width: 8),
              Icon(
                Icons.check_circle_outline,
                color: AppColors.teal,
                size: 24.sp,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: AppColors.bodytext,
                shape: BoxShape.circle,
              ),
            ),
          ),
          horizontalSpacer(width: 8),
          Expanded(
            child: customText(
              text: text,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.bodytext,
              maxLine: 3,
            ),
          ),
        ],
      ),
    );
  }
}
