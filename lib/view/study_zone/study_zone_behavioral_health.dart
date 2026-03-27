import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_routes.dart';

class BehavioralTopic {
  final String title;
  final String subtitle;
  final String icon;

  BehavioralTopic({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class StudyZoneBehavioralHealthView extends StatefulWidget {
  const StudyZoneBehavioralHealthView({super.key});

  @override
  State<StudyZoneBehavioralHealthView> createState() =>
      _StudyZoneBehavioralHealthViewState();
}

class _StudyZoneBehavioralHealthViewState
    extends State<StudyZoneBehavioralHealthView> {
  final List<BehavioralTopic> topics = [
    BehavioralTopic(
      title: 'Case Studies',
      subtitle: '151 lessons',
      icon: AppImages.caseStudy,
    ),
    BehavioralTopic(
      title: 'therapeutic\ncommunication',
      subtitle: '82 lessons',
      icon: AppImages.com,
    ),
    BehavioralTopic(
      title: 'Psych Medications',
      subtitle: '85 lessons',
      icon: AppImages.brain,
    ),
    BehavioralTopic(
      title: 'cultural sensitivity.',
      subtitle: '90 lessons',
      icon: AppImages.culture,
    ),
  ];

  Set<int> selectedIndices = {
    2,
  }; // Psych Medications selected by default to match image

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
                child: customAppBar(isBack: true),
              ),

              verticalSpacer(height: 16),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back Button
                        verticalSpacer(height: 24),

                        // Header Box
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 24.h,
                            horizontal: 8.w,
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
                                text: "Behavioral Health Rx",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 12),
                              customText(
                                text:
                                    "Case-based scenarios, therapeutic communication, psych meds, and culturally sensitive care.",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 24),

                        // Grid of options
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: topics.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16.h,
                                crossAxisSpacing: 16.w,
                                childAspectRatio: 0.9,
                              ),
                          itemBuilder: (context, index) {
                            final isSelected = selectedIndices.contains(index);
                            final topic = topics[index];
                            return GestureDetector(
                              onTap: () {
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
                                  color: isSelected
                                      ? AppColors.teal
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.05,
                                      ),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Icon box
                                        Container(
                                          width: 44.w,
                                          height: 44.w,
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
                                            topic.icon,
                                            width: 24.w,
                                            height: 24.h,
                                            fit: BoxFit.contain,
                                            colorFilter: ColorFilter.mode(
                                              isSelected
                                                  ? AppColors.teal
                                                  : Colors.white,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                        ),
                                        verticalSpacer(height: 16),

                                        // Title
                                        customText(
                                          text: topic.title,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: isSelected
                                              ? Colors.white
                                              : AppColors.charcoal,
                                        ),
                                        const Spacer(),

                                        // Subtitle
                                        customText(
                                          text: topic.subtitle,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: isSelected
                                              ? Colors.white
                                              : AppColors.bodytext,
                                          maxLine: 1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
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
}
