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
import 'package:preprx/utils/app_routes.dart';
import 'package:preprx/view/home/widget/build_card.dart';

class PsychNursingTipsView extends StatelessWidget {
  const PsychNursingTipsView({super.key});

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
                                text: "Psych Nursing Tips",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 8),
                              customText(
                                text: "Share Knowledge, Gain insight",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        verticalSpacer(height: 24),

                        // Filters
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildFilterChip("All", isActive: true),
                              horizontalSpacer(width: 8),
                              _buildFilterChip("Case studies"),
                              horizontalSpacer(width: 8),
                              _buildFilterChip("Patient handling"),
                              horizontalSpacer(width: 8),
                              _buildFilterChip("First Aid"),
                            ],
                          ),
                        ),
                        verticalSpacer(height: 24),

                        // Feed
                        _buildTipCard(
                          name: "RN David C",
                          title: "Clozapine side effects",
                          desc:
                              "Any tips for managing side effects of clozapine in patients?",
                          likes: 45,
                          comments: 7,
                        ),
                        verticalSpacer(height: 20),
                        _buildTipCard(
                          name: "RN David C",
                          title: "Clozapine side effects",
                          desc:
                              "Any tips for managing side effects of clozapine in patients?",
                          likes: 45,
                          comments: 7,
                        ),

                        verticalSpacer(height: 48),

                        // Ask a Question Button
                        customButton(
                          text: "Ask a Question",
                          bgColor: AppColors.gold,
                          borderColor: AppColors.gold,
                          fontColor: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 56,
                          borderRadius: 20,
                          isCircular: false,
                          onPressed: () {
                            goRouter.push(AppRoutes.askQuestion);
                          },
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

  Widget _buildFilterChip(String text, {bool isActive = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isActive ? AppColors.indigo : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: isActive ? AppColors.indigo : Colors.white),
      ),
      child: customText(
        text: text,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: isActive ? Colors.white : AppColors.bodytext,
      ),
    );
  }

  Widget _buildTipCard({
    required String name,
    required String title,
    required String desc,
    required int likes,
    required int comments,
  }) {
    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(
            text: name,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.charcoal,
          ),
          verticalSpacer(height: 8),
          customText(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.charcoal,
          ),
          verticalSpacer(height: 12),
          customText(
            text: desc,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.bodytext,
            maxLine: 3,
          ),
          verticalSpacer(height: 16),
          Row(
            spacing: 24.w,
            children: [
              Row(
                spacing: 8.w,
                children: [
                  SvgPicture.asset(
                    AppImages.favourite, // Assuming it's the heart icon
                    width: 24.w,
                    height: 24.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.teal,
                      BlendMode.srcIn,
                    ),
                  ),
                  customText(
                    text: "$likes likes",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.bodytext,
                  ),
                ],
              ),
              Row(
                spacing: 8.w,
                children: [
                  SvgPicture.asset(
                    AppImages.message, // Assuming it's the comment icon
                    width: 24.w,
                    height: 24.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.teal,
                      BlendMode.srcIn,
                    ),
                  ),
                  customText(
                    text: "$comments comments",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.bodytext,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
