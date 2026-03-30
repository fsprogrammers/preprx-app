import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_button.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_routes.dart';
import 'package:preprx/view/home/widget/build_card.dart';

class StudyBuddyRequestsView extends StatelessWidget {
  const StudyBuddyRequestsView({super.key});

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
                                text: "Study Buddy Requests",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 8),
                              customText(
                                text: "Connect, learn grow together",
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
                              _buildFilterChip("Med- surg"),
                              horizontalSpacer(width: 8),
                              _buildFilterChip("NCLEX Prep"),
                              horizontalSpacer(width: 8),
                              _buildFilterChip("Pharmacology"),
                            ],
                          ),
                        ),
                        verticalSpacer(height: 24),

                        // List of Requests
                        _buildRequestCard(
                          title: "Pharmacology Ace needed",
                          time: "8:00 pm",
                          desc:
                              "Need a partner to help practice with pharmacology",
                          responses: 1,
                        ),
                        verticalSpacer(height: 20),
                        _buildRequestCard(
                          title: "Pharmacology Ace needed",
                          time: "8:00 pm",
                          desc:
                              "Need a partner to help practice with pharmacology",
                          responses: 1,
                        ),

                        verticalSpacer(height: 40),

                        // Create Own Request Button
                        customButton(
                          text: "Create Own Request",
                          bgColor: AppColors.gold,
                          borderColor: AppColors.gold,
                          fontColor: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 56,
                          borderRadius: 20,
                          isCircular: false,
                          onPressed: () {
                            goRouter.push(AppRoutes.createStudyRequest);
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

  Widget _buildRequestCard({
    required String title,
    required String time,
    required String desc,
    required int responses,
  }) {
    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: customText(
                  text: title,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.charcoal,
                ),
              ),
              customText(
                text: time,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.bodytext,
              ),
            ],
          ),
          verticalSpacer(height: 16),
          customText(
            text: desc,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.bodytext,
            maxLine: 3,
          ),
          verticalSpacer(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Message Button
              SizedBox(
                width: 100.w,
                child: customButton(
                  text: "Message",
                  bgColor: AppColors.teal,
                  borderColor: AppColors.teal,
                  fontColor: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 36,
                  borderRadius: 20,
                  isCircular: false,
                  onPressed: () {},
                ),
              ),
              customText(
                text: "$responses response",
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.bodytext,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
