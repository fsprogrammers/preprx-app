import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_buildtile_icon.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_routes.dart';
import 'package:preprx/view/home/widget/build_card.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                verticalSpacer(height: 10),
                customAppBar(isSearch: false),
                verticalSpacer(height: 24),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Main Community Lounge Card
                        buildCard(
                          child: Column(
                            children: [
                              customText(
                                text: "Community Lounge",
                                fontWeight: FontWeight.w700,
                                fontSize: 24, // Increased font size
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 4),
                              customText(
                                text: "Your Nurse Network",
                                fontWeight:
                                    FontWeight.w400, // Make it slightly bolder
                                fontSize: 16,
                                color: const Color(
                                  0xFF0C4866,
                                ), // Indigo-ish color from image
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 16),
                              customText(
                                text:
                                    "Explore supportive spaces curated for your nursing journey.",
                                fontWeight: FontWeight.w400, // Medium weight
                                fontSize: 14,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(
                          height: 32,
                        ), // More spacing before the list
                        // Action Cards
                        _buildActionCard(
                          icon: AppImages.motivation,
                          title: "Motivation Monday",
                          description:
                              "Start your week with wins, positivity, and encouragement",
                          onTap: () {
                            goRouter.push(AppRoutes.motivationMonday);
                          },
                        ),
                        verticalSpacer(height: 20),
                        _buildActionCard(
                          icon: AppImages.studybuddy,
                          title: "Study Buddy Requests",
                          description:
                              "Find a partner for daily accountability or exam prep.",
                          onTap: () {
                            goRouter.push(AppRoutes.studyBuddyRequests);
                          },
                        ),
                        verticalSpacer(height: 20),
                        _buildActionCard(
                          icon: AppImages
                              .brain, // Brain icon might be better for psych
                          title: "Psych Nursing Tips",
                          description:
                              "Therapeutic communication, psych meds, and case insights",
                          onTap: () {
                            goRouter.push(AppRoutes.psychNursingTips);
                          },
                        ),

                        // Extra space for navigation bar
                        verticalSpacer(height: 120),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required String icon,
    required String title,
    required String description,
    VoidCallback? onTap,
  }) {
    return buildCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 12.sp,
            children: [
              buildTealIconBox(icon),
              Expanded(
                child: customText(
                  text: title,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.charcoal,
                ),
              ),
            ],
          ),
          verticalSpacer(height: 12),
          customText(
            text: description,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.bodytext,
            maxLine: 2,
          ),
        ],
      ),
    );
  }
}
