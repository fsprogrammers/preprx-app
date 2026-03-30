import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/view/home/widget/build_card.dart';

class SubliminalStudyView extends StatefulWidget {
  const SubliminalStudyView({super.key});

  @override
  State<SubliminalStudyView> createState() => _SubliminalStudyViewState();
}

class _SubliminalStudyViewState extends State<SubliminalStudyView> {
  String selectedCategory = "Calm";
  bool isEnabled = true;

  final List<String> categories = [
    "Confidence",
    "Calm",
    "Exam Day",
    "Memory",
    "Focus",
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: customAppBar(isSearch: false, isBack: true),
              ),
              verticalSpacer(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        // Header Card
                        buildCard(
                          child: Column(
                            children: [
                              customText(
                                text: "Subliminal Study Mode",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                              verticalSpacer(height: 8),
                              customText(
                                text:
                                    "Quiet affirmations to boost focus while you review.",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                            ],
                          ),
                        ),
                        verticalSpacer(height: 24),

                        // Filter Chips
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: categories.map((cat) {
                              bool isSelected = selectedCategory == cat;
                              return Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedCategory = cat;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 10.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? AppColors.indigo
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20.r),
                                      border: isSelected
                                          ? null
                                          : Border.all(
                                              color: AppColors.teal,
                                              width: 1,
                                            ),
                                    ),
                                    child: customText(
                                      text: cat,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                      fontSize: 14,
                                      color: isSelected
                                          ? Colors.white
                                          : const Color(0xFF0C4866),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        verticalSpacer(height: 40),

                        // Toggle Card
                        buildCard(
                          child: Column(
                            children: [
                              customText(
                                text: "Play Subliminals During Study",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 8),
                              customText(
                                text:
                                    "Soft, barely-audible affirmations run under your study session.",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                              verticalSpacer(height: 24),
                              _buildToggleSwitch(),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 120),
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

  Widget _buildToggleSwitch() {
    return Container(
      width: 180.w,
      height: 54.h,
      decoration: BoxDecoration(
        color: AppColors.indigo,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => isEnabled = true),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isEnabled ? AppColors.gold : Colors.transparent,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    alignment: Alignment.center,
                    child: customText(
                      text: "On",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => isEnabled = false),
                  child: Container(
                    decoration: BoxDecoration(
                      color: !isEnabled ? AppColors.gold : Colors.transparent,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    alignment: Alignment.center,
                    child: customText(
                      text: "Off",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
