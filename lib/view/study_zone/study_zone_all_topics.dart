import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_routes.dart';

class GrowthZone {
  final String title;
  final String subtitle;
  final String icon;

  GrowthZone({required this.title, required this.subtitle, required this.icon});
}

class StudyZoneALlTopicsView extends StatefulWidget {
  const StudyZoneALlTopicsView({super.key});

  @override
  State<StudyZoneALlTopicsView> createState() => _StudyZoneAllTopicsViewState();
}

class _StudyZoneAllTopicsViewState extends State<StudyZoneALlTopicsView> {
  final List<GrowthZone> zones = [
    GrowthZone(
      title: 'Med- Surg',
      subtitle: '151 Lessons',
      icon: 'assets/images/med.svg',
    ),
    GrowthZone(
      title: 'Pediatrics',
      subtitle: '82 Lessons',
      icon: 'assets/images/baby.svg',
    ),
    GrowthZone(
      title: 'Pharmacology',
      subtitle: '85 Lessons',
      icon: 'assets/images/pharma.svg',
    ),
    GrowthZone(
      title: 'Maternity',
      subtitle: '100 Lessons',
      icon: 'assets/images/maternity.svg',
    ),
    GrowthZone(
      title: 'Psych Nursing',
      subtitle: '72 Lessons',
      icon: 'assets/images/brain.svg',
    ),
    GrowthZone(
      title: 'Delegation/priority practice',
      subtitle: '62 Lessons',
      icon: 'assets/images/delegation.svg',
    ),
  ];

  Set<int> selectedIndices = {
    2,
  }; // Pharmacology selected by default to match image

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: GradientBackground(
          child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    customAppBar(isBack: true),

                    verticalSpacer(height: 25),

                    // Header Box
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 12.w,
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
                        children: [
                          customText(
                            text: "All topics",
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: AppColors.charcoal,
                            textAlign: TextAlign.center,
                          ),
                          verticalSpacer(height: 8),
                          customText(
                            text: "Browse major NCLEX domains",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.bodytext,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    verticalSpacer(height: 20),

                    // Grid of options
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: zones.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.h,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 1.0,
                      ),
                      itemBuilder: (context, index) {
                        final isSelected = selectedIndices.contains(index);
                        final zone = zones[index];
                        return GestureDetector(
                          onTap: () {
                            if (zone.title == 'Pharmacology') {
                              goRouter.push(AppRoutes.studyZonePharmacology);
                              return;
                            }
                            setState(() {
                              if (isSelected) {
                                selectedIndices.remove(index);
                              } else {
                                selectedIndices.add(index);
                              }
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.teal : Colors.white,
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Icon box
                                    Container(
                                      width: 40.w,
                                      height: 40.w,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.white
                                            : AppColors.teal,
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: SvgPicture.asset(
                                        zone.icon,
                                        width: 24.w,
                                        height: 24.h,
                                        fit: BoxFit.contain,
                                        
                                        color: isSelected
                                            ? AppColors.teal
                                            : Colors.white,
                                        // size: 24.w,
                                      ),
                                    ),
                                    verticalSpacer(height: 8),

                                    // Title
                                    customText(
                                      text: zone.title,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: isSelected
                                          ? Colors.white
                                          : AppColors.charcoal,
                                    ),
                                    const Spacer(),

                                    // verticalSpacer(height: 8),

                                    // Subtitle
                                    customText(
                                      text: zone.subtitle,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: isSelected
                                          ? Colors.white
                                          : AppColors.bodytext,
                                      maxLine: 3,
                                    ),
                                    const Spacer(),
                                  ],
                                ),

                                // Selected checkmark badge
                                if (isSelected)
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Icon(
                                      Icons.verified,
                                      color: AppColors.gold,
                                      size: 20.w,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    // Extra padding at bottom to prevent overlap with bottom navigation bar
                    verticalSpacer(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
