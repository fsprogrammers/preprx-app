import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_routes.dart';
import 'package:preprx/view/home/widget/build_card.dart';

class ProgressView extends StatefulWidget {
  const ProgressView({super.key});

  @override
  State<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {
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
                child: customAppBar(isSearch: false, isProfile: true),
              ),
              verticalSpacer(height: 32),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: Column(
                      children: [
                        // Countdown Card
                        buildCard(
                          child: Column(
                            children: [
                              customText(
                                text: "24 Days Until Your NCLEX",
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                              verticalSpacer(height: 12),
                              customText(
                                text:
                                    "Stay consistent- your RN badge is waiting",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                            ],
                          ),
                        ),
                        verticalSpacer(height: 24),

                        // Affirmation Card with Play button
                        buildCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: "Affirmation",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.charcoal,
                              ),
                              verticalSpacer(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 44.w,
                                    height: 44.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.teal,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 30.sp,
                                    ),
                                  ),
                                  horizontalSpacer(width: 16),
                                  Expanded(
                                    child: customText(
                                      text:
                                          "I am calm, capable and ready to succeed and step into my purpose",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: AppColors.charcoal,
                                      maxLine: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        verticalSpacer(height: 40),

                        // View Treatment Plan Button
                        SizedBox(
                          width: double.infinity,
                          height: 56.h,
                          child: ElevatedButton(
                            onPressed: () {
                              goRouter.push(AppRoutes.treatmentPlan);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.gold,
                              foregroundColor: AppColors.charcoal,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            child: customText(
                              text: "View Treatment Plan",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.charcoal,
                            ),
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
}
