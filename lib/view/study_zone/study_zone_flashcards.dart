import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_button.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/view/study_zone/widget/widget_flash_card.dart';

class FlashcardData {
  final String category;
  final String question;
  final String tip;

  FlashcardData({
    required this.category,
    required this.question,
    required this.tip,
  });
}

class StudyZoneFlashcardsView extends StatefulWidget {
  const StudyZoneFlashcardsView({super.key});

  @override
  State<StudyZoneFlashcardsView> createState() =>
      _StudyZoneFlashcardsViewState();
}

class _StudyZoneFlashcardsViewState extends State<StudyZoneFlashcardsView> {
  String selectedFilter = 'All';

  final List<FlashcardData> flashcards = [
    FlashcardData(
      category: "Pharmacology",
      question: "Priority assessment for a client taking Digoxin?",
      tip: "Use the 'Hold if HR < 60' rule.",
    ),
    FlashcardData(
      category: "Pharmacology",
      question: "Priority assessment for a client taking Digoxin?",
      tip: "Use the 'Hold if HR < 60' rule.",
    ),
  ];

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
                // Since there is no back button in mockup, we pass isBack false (default)
                child: customAppBar(),
              ),

              verticalSpacer(height: 24),

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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              customText(
                                text: "Flash Cards",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  customText(
                                    text: "Your Saved Cards: ",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.bodytext,
                                  ),
                                  customText(
                                    text: "125 Total",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColors.teal,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 24),

                        // Filters
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildFilterChip("All"),
                            horizontalSpacer(width: 12),
                            _buildFilterChip("Newest"),
                            horizontalSpacer(width: 12),
                            _buildFilterChip("Oldest"),
                          ],
                        ),

                        verticalSpacer(height: 24),

                        // Flashcards List
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: flashcards.length,
                          separatorBuilder: (context, index) =>
                              verticalSpacer(height: 16),
                          itemBuilder: (context, index) {
                            final card = flashcards[index];
                            return buildFlashcard(card);
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

  Widget _buildFilterChip(String label) {
    bool isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.charcoal : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: customText(
          text: label,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
          fontSize: 12,
          color: isSelected ? Colors.white : AppColors.bodytext,
        ),
      ),
    );
  }
}
