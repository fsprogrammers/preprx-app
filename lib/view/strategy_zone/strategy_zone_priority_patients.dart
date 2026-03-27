import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_button.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';

class StrategyZonePriorityPatientsView extends StatelessWidget {
  const StrategyZonePriorityPatientsView({super.key});

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
                  isBack: true,
                  isSearch: false,
                  isProfile: true,
                ),
              ),

              verticalSpacer(height: 16),

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
                            vertical: 32.h,
                            horizontal: 16.w,
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
                                text: "Priority Patient Sorting Practice",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                              verticalSpacer(height: 12),
                              customText(
                                text: "Learn how to sort priority patients",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 24),

                        // Grid of patients
                        GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h,
                          childAspectRatio: 0.86,
                          children: [
                            _buildPatientCard(
                              iconPath: AppImages.lungs,
                              title: "Chest Pain",
                              description: "Spot cardiac\ndanger fast.",
                              onTap: () {
                                _showPatientDialog(
                                  context,
                                  title: "Chest Pain",
                                  priority: "See First",
                                  content:
                                      "Chest pain may indicate cardiac ischemia — immediate attention is required",
                                );
                              },
                            ),
                            _buildPatientCard(
                              iconPath: AppImages.lowblood,
                              title: "Low Blood Sugar",
                              description: "Address life-\nthreatening drops",
                              onTap: () {
                                _showPatientDialog(
                                  context,
                                  title: "Low Blood Sugar",
                                  priority: "See Second",
                                  content:
                                      "Low glucose can lead to seizures or loss of consciousness — rapid glucose correction is needed.",
                                );
                              },
                            ),
                            _buildPatientCard(
                              iconPath: AppImages.confused,
                              title: "Confused elderly",
                              description:
                                  "Identify safety\nrisks at a glance.",
                              highlighted: true,
                              onTap: () {
                                _showPatientDialog(
                                  context,
                                  title: "Confused Elderly",
                                  priority: "See Third",
                                  content:
                                      "Acute confusion may indicate infection or hypoxia — requires prompt assessment but not before unstable conditions",
                                );
                              },
                            ),
                            _buildPatientCard(
                              iconPath: AppImages.wheezing,
                              title: "New onset\nwheezing",
                              description: "Catch airway\ncompromise",
                              onTap: () {
                                _showPatientDialog(
                                  context,
                                  title: "New Onset Wheezing",
                                  priority: "See Fourth",
                                  content:
                                      "New wheezing suggests airway narrowing — important to assess, but not as critical as chest pain or severe hypoglycemia.",
                                );
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

  void _showPatientDialog(
    BuildContext context, {
    required String title,
    required String priority,
    required String content,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                customText(
                  text: title,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColors.charcoal,
                  textAlign: TextAlign.center,
                ),
                verticalSpacer(height: 12),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16.sp,
                      color: AppColors.charcoal,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "Priority: ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      TextSpan(
                        text: priority,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.charcoal,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpacer(height: 32),
                customText(
                  text: content,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.bodytext,
                  textAlign: TextAlign.center,
                  maxLine: 5,
                ),
                verticalSpacer(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: customButton(
                        text: "Next",
                        bgColor: AppColors.gold,
                        borderColor: AppColors.gold,
                        fontColor: AppColors.charcoal,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 37,
                        borderRadius: 20,
                        isCircular: false,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    horizontalSpacer(width: 16),
                    Expanded(
                      child: customButton(
                        text: "Close",
                        bgColor: AppColors.teal,
                        borderColor: AppColors.teal,
                        fontColor: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 37,
                        borderRadius: 20,
                        isCircular: false,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPatientCard({
    required String iconPath,
    required String title,
    required String description,
    bool highlighted = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: highlighted ? AppColors.teal : Colors.white,
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
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: highlighted ? Colors.white : AppColors.teal,
                borderRadius: BorderRadius.circular(8.r),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                iconPath,
                width: 20.w,
                height: 20.h,
                colorFilter: ColorFilter.mode(
                  highlighted ? AppColors.teal : Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            verticalSpacer(height: 12),
            customText(
              text: title,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: highlighted ? Colors.white : AppColors.charcoal,
              maxLine: 2,
            ),
            verticalSpacer(height: 8),
            customText(
              text: description,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: highlighted ? Colors.white : AppColors.bodytext,
              maxLine: 3,
            ),
          ],
        ),
      ),
    );
  }
}
