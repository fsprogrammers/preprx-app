import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_buildtile_icon.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_routes.dart';
import 'package:preprx/view/home/widget/build_card.dart';
import 'package:preprx/view/study_zone/widget/build_grid_card.dart';

class StudyZoneView extends StatelessWidget {
  const StudyZoneView({super.key});

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

              // Custom Top App Bar
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        customAppBar(),
                        verticalSpacer(height: 24),

                        // Study Zone Header Card
                        buildCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              customText(
                                text: "Study Zone",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                              ),
                              verticalSpacer(height: 6),
                              customText(
                                text: "Pharmacy of knowledge",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 16),

                        // Crash Courses Card
                        buildCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buildTealIconBox(AppImages.course),
                                  horizontalSpacer(width: 12),
                                  customText(
                                    text: "Crash Courses",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColors.charcoal,
                                  ),
                                ],
                              ),
                              verticalSpacer(height: 12),
                              customText(
                                text:
                                    "Short, sharp videos for fast NCLEX wins.",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 16),

                        // Grid
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  goRouter.push(AppRoutes.studyZoneALlTopics);
                                },
                                child: buildGridCard(
                                  AppImages.allTopics,
                                  "All topics",
                                ),
                              ),
                            ),
                            horizontalSpacer(width: 16),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  goRouter.push(
                                    AppRoutes.studyZoneBehavioralHealth,
                                  );
                                },
                                child: buildGridCard(
                                  AppImages.behavior,
                                  "Behavioral\nHealth RX",
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  goRouter.push(
                                    AppRoutes.studyZonePriorityPractice,
                                  );
                                },
                                child: buildGridCard(
                                  AppImages.priority,
                                  "Priority\nPractice",
                                ),
                              ),
                            ),
                            horizontalSpacer(width: 16),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  goRouter.push(AppRoutes.studyZoneCustomQuiz);
                                },
                                child: buildGridCard(
                                  AppImages.quizes,
                                  "Custom\nQuizzes",
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Bottom Spacer for Bottom Nav
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
