import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_routes.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/view/strategy_zone/widget/strategy_card.dart';

class StrategyZoneView extends StatelessWidget {
  const StrategyZoneView({super.key});

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

              // Top App Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: customAppBar(
                  isBack: false,
                  isSearch: false,
                  isProfile: true,
                ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  // Cyan Icon Box
                                  Container(
                                    width: 40.w,
                                    height: 40.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.teal,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      AppImages
                                          .hintBulb, // Reusing bulb icon from flashcards
                                      width: 24.w,
                                      height: 24.h,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                  horizontalSpacer(width: 16),
                                  customText(
                                    text: "Strategy Zone",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    color: AppColors.charcoal,
                                  ),
                                ],
                              ),
                              verticalSpacer(height: 12),
                              customText(
                                text:
                                    "Quick, powerful techniques to\nraise your score instantly",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.bodytext,
                                maxLine: 2,
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 24),

                        // Grid
                        GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h,
                          childAspectRatio: 1.0,
                          children: [
                            buildStrategyCard(
                              title: "Priority\nFramework",
                              icon: AppImages.priorityframe,
                              onTap: () {
                                goRouter.push(
                                  AppRoutes.strategyZonePriorityFramework,
                                );
                              },
                            ),
                            buildStrategyCard(
                              title: "Elimination\nTechniques",
                              icon: AppImages.elimination,
                              onTap: () {
                                goRouter.push(
                                  AppRoutes.strategyZoneElimination,
                                );
                              },
                            ),
                            buildStrategyCard(
                              title: "NCLEX\nLanguage\nDecoder",
                              icon: AppImages.nclex,
                              onTap: () {
                                goRouter.push(
                                  AppRoutes.strategyZoneLanguageDecoder,
                                );
                              },
                            ),
                            buildStrategyCard(
                              title: "SATA Boot\nCamp",
                              icon: AppImages.sata,
                              onTap: () {
                                goRouter.push(
                                  AppRoutes.strategyZoneSataBootcamp,
                                );
                              },
                            ),
                            buildStrategyCard(
                              title: "Critical\nThinking\nDrills",
                              icon: AppImages.critical,
                              onTap: () {
                                goRouter.push(
                                  AppRoutes.strategyZoneCriticalThinking,
                                );
                              },
                            ),
                            buildStrategyCard(
                              title: "Priority\nPatients",
                              icon: AppImages.patient,
                              onTap: () {
                                goRouter.push(
                                  AppRoutes.strategyZonePriorityPatients,
                                );
                              },
                            ),
                            buildStrategyCard(
                              title: "Pharm\nShortcuts",
                              icon: AppImages.shortcut,
                              onTap: () {
                                goRouter.push(AppRoutes.strategyZonePharmHacks);
                              },
                            ),
                            buildStrategyCard(
                              title: "Test Day\nMindset",
                              icon: AppImages.mindset,
                              onTap: () {
                                goRouter.push(AppRoutes.strategyZoneMindset);
                              },
                            ),
                          ],
                        ),

                        // Bottom padding
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
}
