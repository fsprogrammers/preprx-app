import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_buildtile_icon.dart';
import 'package:preprx/components/custom_button.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/components/custom_toplogo.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/view/home/widget/build_card.dart';
import 'package:preprx/view/home/widget/build_tag.dart';
import 'package:preprx/view/home/widget/icon_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      drawer: const CustomDrawer(),
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),

            child: Column(
              children: [
                verticalSpacer(height: 10),

                // Custom Top App Bar
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 24.w),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       // Menu Icon
                //       iconButton(
                //         icon: AppImages.drawer,
                //         onPressed: () {},
                //         width: 18,
                //         height: 12,
                //       ),

                //       // Center Logo
                //       customTopLogo(),

                //       iconButton(icon: AppImages.person, onPressed: () {}),
                //     ],
                //   ),
                // ),
                customAppBar(isSearch: false),

                verticalSpacer(height: 24),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. Hi, Future RN Card
                        buildCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: "Hi, Future RN",
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: AppColors.charcoal,
                              ),
                              verticalSpacer(height: 4),
                              customText(
                                text: "Good morning",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                              ),
                              verticalSpacer(height: 16),
                              Row(
                                children: [
                                  buildTealIconBox(
                                    AppImages.dose,
                                    color: AppColors.lightTeal,
                                  ),
                                  horizontalSpacer(width: 12),
                                  customText(
                                    text: "1st dose completed",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: AppColors.bodytext,
                                  ),
                                ],
                              ),
                              verticalSpacer(height: 16),
                              Align(
                                alignment: Alignment.centerRight,
                                child: customText(
                                  text: "30% to full confidence",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColors.bodytext,
                                ),
                              ),
                              verticalSpacer(height: 6),
                              // Progress Bar
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: LinearProgressIndicator(
                                  value: 0.3,
                                  minHeight: 10.h,
                                  backgroundColor: AppColors.teal,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        AppColors.gold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 16),

                        // 2. Daily Dose Card
                        buildCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: "Daily Dose",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.charcoal,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpacer(height: 12),
                                    customText(
                                      text: "25 NCLEX questions today",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: AppColors.charcoal,
                                    ),
                                    verticalSpacer(height: 12),

                                    // Tags
                                    Row(
                                      children: [
                                        buildTag("Pharmacology"),
                                        horizontalSpacer(width: 10),
                                        buildTag("Pediatrics"),
                                      ],
                                    ),

                                    verticalSpacer(height: 20),

                                    // Start Today's Dose Button
                                    customButton(
                                      context: context,
                                      text: "Start Today's Dose",
                                      fontSize: 14,
                                      height: 40,
                                      width: 180,
                                      borderColor: Colors.transparent,
                                      bgColor: AppColors.teal,
                                      fontColor: Colors.white,
                                      borderRadius: 20,
                                      isCircular: true,
                                      fontWeight: FontWeight.w400,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 16),

                        // 3. Mindset Moment Card
                        buildCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: "Mindset Moment",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.charcoal,
                              ),
                              verticalSpacer(height: 8),
                              Row(
                                spacing: 10.sp,
                                children: [
                                  buildTealIconBox(AppImages.pause),

                                  Expanded(
                                    child: customText(
                                      text:
                                          "I am calm, capable and ready to succeed",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: AppColors.bodytext,
                                      maxLine: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 16),

                        // 4. Quick tip Card
                        buildCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: "Quick tip",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.charcoal,
                              ),
                              verticalSpacer(height: 8),
                              Row(
                                spacing: 10.sp,
                                children: [
                                  buildTealIconBox(AppImages.bulb),

                                  Expanded(
                                    child: customText(
                                      text:
                                          "Remember the ABCs ( Airway, Breathing, circulation)",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: AppColors.bodytext,
                                      maxLine: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 30),

                        // View Treatment Plan Button
                        customButton(
                          context: context,
                          text: "View Treatment Plan",
                          fontSize: 16,
                          height: 52,
                          borderColor: Colors.transparent,
                          bgColor: AppColors.gold,
                          fontColor: AppColors.charcoal,
                          borderRadius: 16,
                          isCircular: false,
                          fontWeight: FontWeight.w600,
                          onPressed: () {},
                        ),

                        // Extra space to prevent cut off from bottom nav bar since it floats (extendBody = true)
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
}
