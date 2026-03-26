import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_button.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_routes.dart';

class StudyZoneQuizQuestionView extends StatefulWidget {
  const StudyZoneQuizQuestionView({super.key});

  @override
  State<StudyZoneQuizQuestionView> createState() =>
      _StudyZoneQuizQuestionViewState();
}

class _StudyZoneQuizQuestionViewState extends State<StudyZoneQuizQuestionView> {
  int? selectedOptionIndex;
  bool isSubmitted = false;

  final int correctAnswerIndex = 0; // "A" is correct as per mockup

  final List<String> options = [
    "Position the client in high Fowler's",
    "Encourage increased fluid intake",
    "Administer PRN cough suppressant",
    "Provide a high-calorie meal",
  ];

  final List<String> letters = ["A", "B", "C", "D"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              verticalSpacer(height: 10),

              // Top App Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: customAppBar(isBack: true),
              ),

              verticalSpacer(height: 16),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacer(height: 16),

                        // Question Box
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 20.h,
                            horizontal: 12.w,
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  customText(
                                    text: "Q1/15",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.bodytext,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    color: AppColors.bodytext,
                                    size: 20.sp,
                                  ),
                                ],
                              ),
                              verticalSpacer(height: 16),
                              customText(
                                text:
                                    "A patient with COPD is experiencing increasing shortness of breath. Which intervention should the nurse prioritize?\"",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.start,
                                maxLine: 4, // allow multiple lines
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 24),

                        // Options
                        ...List.generate(options.length, (index) {
                          bool isSelected = selectedOptionIndex == index;
                          bool showAsCorrect =
                              isSubmitted && index == correctAnswerIndex;
                          bool showBorder = isSubmitted
                              ? showAsCorrect
                              : isSelected;

                          return GestureDetector(
                            onTap: () {
                              if (!isSubmitted) {
                                setState(() {
                                  selectedOptionIndex = index;
                                });
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 12.h),
                              padding: EdgeInsets.symmetric(
                                vertical: 16.h,
                                horizontal: 16.w,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24.r),
                                border: Border.all(
                                  color: showBorder
                                      ? Colors.green
                                      : Colors.transparent,
                                  width: 2.w,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  customText(
                                    text: letters[index],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColors.teal,
                                  ),
                                  horizontalSpacer(width: 16),
                                  Expanded(
                                    child: customText(
                                      text: options[index],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColors.bodytext,
                                    ),
                                  ),
                                  if (showAsCorrect)
                                    Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 20.sp,
                                    ),
                                ],
                              ),
                            ),
                          );
                        }),

                        // Rationale Sections (Animated visibility or just conditionally rendered)
                        if (isSubmitted && selectedOptionIndex != null) ...[
                          verticalSpacer(height: 16),

                          // Rationale Details
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 20.h,
                              horizontal: 20.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                  text: "Rationale",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: AppColors.magenta,
                                ),
                                verticalSpacer(height: 12),
                                customText(
                                  text: "Why this answer is correct",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColors.bodytext,
                                ),
                                verticalSpacer(height: 4),
                                customText(
                                  text:
                                      "High Fowler's improves lung expansion and reduces work of breathing",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColors.bodytext,
                                  maxLine: 3,
                                ),
                                verticalSpacer(height: 16),
                                customText(
                                  text: "Why this answers are incorrect",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColors.bodytext,
                                ),
                                verticalSpacer(height: 8),
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

                          verticalSpacer(height: 16),

                          // Why this matters on floor
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 20.h,
                              horizontal: 20.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                  text: "Why this matters on floor",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColors.bodytext,
                                ),
                                verticalSpacer(height: 8),
                                customText(
                                  text:
                                      "Prioritizing airway positioning is a real-world immediate intervention for respiratory distress.",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColors.bodytext,
                                  maxLine: 3,
                                ),
                              ],
                            ),
                          ),

                          verticalSpacer(height: 16),

                          // Ask Michelle
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 24.h,
                              horizontal: 24.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    customText(
                                      text: "Need a clearer explanation?",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: AppColors.bodytext,
                                      textAlign: TextAlign.right,
                                    ),
                                    customText(
                                      text: "Ask Michelle",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: AppColors.bodytext,
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                                horizontalSpacer(width: 12),
                                Icon(
                                  Icons
                                      .messenger, // Closest matching standard icon for chat bubble
                                  color: AppColors.magenta,
                                  size: 40.sp,
                                ),
                              ],
                            ),
                          ),
                        ],

                        verticalSpacer(height: 24),

                        // Action Button
                        customButton(
                          context: context,
                          text: isSubmitted ? "Add to flash card" : "Submit",
                          fontSize: 16,
                          height: 50,
                          borderColor: AppColors.gold,
                          bgColor: AppColors.gold,
                          fontColor: AppColors.charcoal,
                          borderRadius: 25,
                          isCircular: true,
                          fontWeight: FontWeight.w600,
                          onPressed: () {
                            if (!isSubmitted) {
                              if (selectedOptionIndex != null) {
                                setState(() {
                                  isSubmitted = true;
                                });
                              } else {
                                // Provide simple feedback maybe
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Please select an option first",
                                    ),
                                  ),
                                );
                              }
                            } else {
                              goRouter.push(AppRoutes.studyZoneFlashcards);
                              // Handle Add to flash card logic here
                            }
                          },
                        ),

                        // Extra padding at bottom
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

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h, left: 8.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(
            text: "•",
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: AppColors.bodytext,
          ),
          horizontalSpacer(width: 8),
          Expanded(
            child: customText(
              text: text,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.bodytext,
              maxLine: 2,
            ),
          ),
        ],
      ),
    );
  }
}
