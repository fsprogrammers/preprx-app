import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_routes.dart';

class PharmacologyTopic {
  final String title;
  final String questionCount;
  final String updateYear;

  PharmacologyTopic({
    required this.title,
    required this.questionCount,
    required this.updateYear,
  });
}

class StudyZonePharmacologyView extends StatelessWidget {
  StudyZonePharmacologyView({super.key});

  final List<PharmacologyTopic> topics = [
    PharmacologyTopic(
      title: 'Fluid & electrolytes',
      questionCount: '45 Qs',
      updateYear: 'Updated 2025',
    ),
    PharmacologyTopic(
      title: 'Drug Behavior',
      questionCount: '45 Qs',
      updateYear: 'Updated 2025',
    ),
    PharmacologyTopic(
      title: 'Agonists',
      questionCount: '45 Qs',
      updateYear: 'Updated 2025',
    ),
    PharmacologyTopic(
      title: 'Antagonists',
      questionCount: '45 Qs',
      updateYear: 'Updated 2025',
    ),
    PharmacologyTopic(
      title: 'Chemical Messengers',
      questionCount: '45 Qs',
      updateYear: 'Updated 2025',
    ),
    PharmacologyTopic(
      title: 'Receptors',
      questionCount: '45 Qs',
      updateYear: 'Updated 2025',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              verticalSpacer(height: 10),

              // Top App Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: customAppBar(),
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
                        InkWell(
                          onTap: () {
                            goRouter.pop();
                          },
                          borderRadius: BorderRadius.circular(8.r),
                          child: SvgPicture.asset(
                            AppImages.back,
                            width: 24.w,
                            height: 24.h,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),

                        verticalSpacer(height: 24),

                        // Header Box
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 24.h,
                            horizontal: 6.w,
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
                                text: "Pharmacology",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 6),
                              customText(
                                text: "Study the topic you want to be master",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 16),

                        // List of Topics
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: topics.length,
                          separatorBuilder: (context, index) =>
                              verticalSpacer(height: 12),
                          itemBuilder: (context, index) {
                            final topic = topics[index];
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 16.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText(
                                    text: topic.title,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: AppColors.charcoal,
                                  ),
                                  verticalSpacer(height: 8),
                                  Row(
                                    children: [
                                      customText(
                                        text: topic.questionCount,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: AppColors.magenta,
                                      ),
                                      horizontalSpacer(width: 12),
                                      customText(
                                        text: topic.updateYear,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: AppColors.bodytext,
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: AppColors.magenta,
                                        size: 20.sp,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        // Extra padding at bottom to prevent overlap with bottom navigation bar
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
