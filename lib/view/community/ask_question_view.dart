import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_button.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/view/home/widget/build_card.dart';

class AskQuestionView extends StatelessWidget {
  const AskQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              verticalSpacer(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        // Header Card
                        buildCard(
                          child: Column(
                            children: [
                              customText(
                                text: "Ask a Question",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                              verticalSpacer(height: 8),
                              customText(
                                text: "Share your query with community",
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

                        // Section 1: Select Category
                        _buildFormSection(
                          label: "Select category",
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(color: AppColors.bodytext),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customText(
                                  text: "Medications",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AppColors.bodytext,
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.bodytext,
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalSpacer(height: 16),

                        // Section 2: Your question
                        _buildFormSection(
                          label: "Your question",
                          child: Container(
                            width: double.infinity,
                            height: 60.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(color: AppColors.bodytext),
                            ),
                            child: customText(
                              text: "Type your question here",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.bodytext.withValues(alpha: 0.6),
                            ),
                          ),
                        ),

                        verticalSpacer(height: 48),

                        // Submit Question Button
                        customButton(
                          text: "Submit Question",
                          bgColor: AppColors.gold,
                          borderColor: AppColors.gold,
                          fontColor: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 56,
                          borderRadius: 20,
                          isCircular: false,
                          onPressed: () {},
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

  Widget _buildFormSection({required String label, required Widget child}) {
    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(
            text: label,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.charcoal,
          ),
          verticalSpacer(height: 12),
          child,
        ],
      ),
    );
  }
}
