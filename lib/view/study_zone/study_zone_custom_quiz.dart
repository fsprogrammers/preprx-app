import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_button.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';

class StudyZoneCustomQuizView extends StatefulWidget {
  const StudyZoneCustomQuizView({super.key});

  @override
  State<StudyZoneCustomQuizView> createState() =>
      _StudyZoneCustomQuizViewState();
}

class _StudyZoneCustomQuizViewState extends State<StudyZoneCustomQuizView> {
  double difficultyValue = 1; // 0: Easy, 1: Moderate, 2: Hard
  bool isTimeMode = true;
  int selectedTime = 10;
  int numQuestions = 15;

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
                        verticalSpacer(height: 24),

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
                                text: "Custom Quizzes",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 12),
                              customText(
                                text:
                                    "Build your own quiz based on topic, difficulty, or time.",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 24),

                        // Main Content Box
                        Container(
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
                              // Choose Topic Section
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  customText(
                                    text: "Choose Topic",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColors.charcoal,
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColors.charcoal,
                                    size: 28.sp,
                                  ),
                                ],
                              ),
                              verticalSpacer(height: 16),
                              Wrap(
                                spacing: 4.w,
                                runSpacing: 6.h,
                                children: [
                                  _buildTopicChip("Fluid and electrolytes"),
                                  _buildTopicChip("Drug behavior"),
                                ],
                              ),

                              verticalSpacer(height: 32),

                              // Difficulty Section
                              customText(
                                text: "Difficulty",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.bodytext,
                              ),
                              verticalSpacer(height: 4),
                              customText(
                                text: "Select how challenging you want it",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                              ),

                              // Slider
                              SliderTheme(
                                data: SliderThemeData(
                                  trackHeight: 8.h,
                                  activeTrackColor: AppColors.gold,
                                  inactiveTrackColor: AppColors.teal,
                                  thumbColor: AppColors.gold,
                                  overlayColor: AppColors.gold.withValues(
                                    alpha: 0.2,
                                  ),
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 10.r,
                                  ),
                                ),
                                child: Slider(
                                  value: difficultyValue,
                                  min: 0,
                                  max: 2,
                                  divisions: 2,
                                  onChanged: (value) {
                                    setState(() {
                                      difficultyValue = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildSliderLabel("Easy", 0),
                                    _buildSliderLabel("Moderate", 1),
                                    _buildSliderLabel("Hard", 2),
                                  ],
                                ),
                              ),

                              verticalSpacer(height: 16),

                              // Time Section
                              customText(
                                text: "Time",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.charcoal,
                              ),

                              Row(
                                children: [
                                  customText(
                                    text: "Time Mode",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.charcoal,
                                  ),
                                  horizontalSpacer(width: 16),
                                  Transform.scale(
                                    scale: 0.7,
                                    child: Switch(
                                      value: isTimeMode,
                                      onChanged: (val) {
                                        setState(() {
                                          isTimeMode = val;
                                        });
                                      },
                                      activeColor: Colors.white,
                                      activeTrackColor: AppColors.teal,
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor: AppColors.primaryGrey,
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpacer(height: 8),

                              // Time Selector Buttons
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    _buildTimeButton(10),
                                    _buildTimeButton(20),
                                    _buildTimeButton(30),
                                    _buildTimeButton(40),
                                  ],
                                ),
                              ),

                              verticalSpacer(height: 16),

                              // Number of questions
                              customText(
                                text: "Number of questions",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.charcoal,
                              ),
                              verticalSpacer(height: 16),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8.h,
                                    horizontal: 24.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(
                                      0xff787b80,
                                    ).withValues(alpha: 0.20),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            numQuestions++;
                                          });
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: AppColors.charcoal,
                                        ),
                                      ),
                                      horizontalSpacer(width: 32),
                                      customText(
                                        text: numQuestions.toString(),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: AppColors.charcoal,
                                      ),
                                      horizontalSpacer(width: 32),
                                      InkWell(
                                        onTap: () {
                                          if (numQuestions > 1) {
                                            setState(() {
                                              numQuestions--;
                                            });
                                          }
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: AppColors.charcoal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 24),

                        // Start Quiz Button
                        customButton(
                          context: context,
                          text: "Start Quiz",
                          fontSize: 16,
                          height: 52,
                          borderColor: AppColors.gold,
                          bgColor: AppColors.gold,
                          fontColor: AppColors.charcoal,
                          borderRadius: 20,
                          isCircular: true,
                          fontWeight: FontWeight.w600,
                          onPressed: () {},
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

  // Helper Widgets
  Widget _buildTopicChip(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.charcoal,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: customText(
        text: title,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: Colors.white,
      ),
    );
  }

  Widget _buildSliderLabel(String label, double value) {
    bool isActive = difficultyValue == value;
    return customText(
      text: label,
      fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
      fontSize: 12,
      color: AppColors.bodytext, // Or maybe a softer color if not active
    );
  }

  Widget _buildTimeButton(int minutes) {
    bool isSelected = selectedTime == minutes;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = minutes;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 6.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.charcoal : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.charcoal : AppColors.greyBorder,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: customText(
          text: "$minutes min",
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
          fontSize: 12,
          color: isSelected ? Colors.white : AppColors.bodytext,
        ),
      ),
    );
  }
}
