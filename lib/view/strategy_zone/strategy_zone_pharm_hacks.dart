import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_button.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';

class StrategyZonePharmHacksView extends StatelessWidget {
  const StrategyZonePharmHacksView({super.key});

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
                                text: "Pharm Strategy Hacks",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 12),
                              customText(
                                text:
                                    "Don't memorize 10,000 drugs! Focus\nyour study time on these high-yield\ntesting strategies.",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                                maxLine: 4,
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 16),

                        // A. Suffix Shortcuts
                        _buildHackSection(
                          title: "A. Suffix Shortcuts",
                          children: [
                            _buildInfoItem(
                              header: "-pril",
                              text: "ACE Inhibitor (Antihypertensive).",
                              label: "Priority:",
                              labelText: "Monitor cough and angioedem.",
                            ),
                            verticalSpacer(height: 24),
                            _buildInfoItem(
                              header: "-lol",
                              text: "Beta Blocker",
                              label: "Priority:",
                              labelText: "Monitor HR and BP (Hold if HR < 60).",
                            ),
                            verticalSpacer(height: 24),
                            _buildInfoItem(
                              header: "-sartan",
                              text: "ARBs",
                              label: "Priority:",
                              labelText:
                                  "Monitor BP safe for clients with\ncough from ACE Inhibitors.",
                            ),
                          ],
                        ),

                        verticalSpacer(height: 16),

                        // B. Most Testable Categories
                        _buildHackSection(
                          title: "B. Most Testable Categories",
                          children: [
                            _buildInfoItem(
                              header: "Anticoagulants",
                              text: "Heparin, Warfarin",
                              label: "Focus:",
                              labelText: "Bleeding risk.",
                            ),
                            verticalSpacer(height: 24),
                            _buildInfoItem(
                              header: "Insulins/Hypoglycemics",
                              text:
                                  "Beta Blocker", // Note: The mockup shows Beta Blocker here too, but likely for the "Insulins" section.
                              // I'll follow mockup exactly even if it seems like a typo in mockup.
                              label: "Focus:",
                              labelText: "Peak times, Hypoglycemia\nsymptoms.",
                            ),
                            verticalSpacer(height: 24),
                            _buildInfoItem(
                              header: "Cardiac Glycosides",
                              text: "Digoxin",
                              label: "Focus:",
                              labelText:
                                  "Apical pulse (<60 hold), Toxicity\nsymptoms.",
                            ),
                          ],
                        ),

                        verticalSpacer(height: 16),

                        // C. What NCLEX Looks For
                        _buildHackSection(
                          title: "C. What NCLEX Looks For",
                          children: [
                            _buildStrategyItem(
                              header: "Side Effects",
                              text:
                                  "Focus on adverse effects that are life-threatening (e.g., respiratory depression, liver toxicity).",
                            ),
                            verticalSpacer(height: 24),
                            _buildStrategyItem(
                              header: "Priorities",
                              text:
                                  "What must the nurse check before giving the drug? (Vitals, labs).",
                            ),
                            verticalSpacer(height: 24),
                            _buildStrategyItem(
                              header: "Patient Education",
                              text:
                                  "What safety measures must the patient know (e.g., avoiding sun, not stopping abruptly)",
                            ),
                          ],
                        ),

                        verticalSpacer(height: 32),

                        // Action Button
                        customButton(
                          text: "Launch Pharm Quizz",
                          bgColor: AppColors.gold,
                          borderColor: AppColors.gold,
                          fontColor: AppColors.charcoal,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 52,
                          borderRadius: 20,
                          isCircular: false,
                          onPressed: () {},
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

  Widget _buildHackSection({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
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
          customText(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.charcoal,
          ),
          verticalSpacer(height: 24),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required String header,
    required String text,
    required String label,
    required String labelText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
          text: header,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: AppColors.indigo,
        ),
        verticalSpacer(height: 8),
        customText(
          text: text,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.bodytext,
        ),
        verticalSpacer(height: 4),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14.sp,
              color: AppColors.bodytext,
            ),
            children: [
              TextSpan(
                text: "$label ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.teal,
                ),
              ),
              TextSpan(
                text: labelText,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.bodytext,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStrategyItem({required String header, required String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
          text: header,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: AppColors.indigo,
        ),
        verticalSpacer(height: 8),
        customText(
          text: text,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.bodytext,
          maxLine: 5,
        ),
      ],
    );
  }
}
