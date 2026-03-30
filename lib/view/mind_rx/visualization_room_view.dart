import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/view/home/widget/build_card.dart';

class VisualizationRoomView extends StatelessWidget {
  const VisualizationRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              verticalSpacer(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: customAppBar(isSearch: false, isBack: true),
              ),
              verticalSpacer(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        // Header Card
                        buildCard(
                          child: Column(
                            children: [
                              customText(
                                text: "Visualization Room",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                              verticalSpacer(height: 8),
                              customText(
                                text:
                                    "Short guided mental journeys to calm your mind.",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                            ],
                          ),
                        ),
                        verticalSpacer(height: 24),

                        // Journey Card 1
                        _buildJourneyCard(
                          title: "Pre-Study Calm",
                          subtitle: "Ground Yourself",
                          duration: "2-3 min",
                          desc:
                              "Ease into your study session with slow breathing and mental clarity.",
                          imageUrl:
                              "https://images.unsplash.com/photo-1518199266791-5375a83190b7?q=80&w=2070&auto=format&fit=crop",
                        ),
                        verticalSpacer(height: 20),

                        // Journey Card 2
                        _buildJourneyCard(
                          title: "Exam-Day Confidence",
                          subtitle: "Step Into Your Power",
                          duration: "6 min",
                          desc:
                              "Visualize yourself choosing answers calmly and confidently.",
                          imageUrl:
                              "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=2073&auto=format&fit=crop",
                        ),
                        verticalSpacer(height: 20),

                        // Journey Card 3
                        _buildJourneyCard(
                          title: "Night Reset",
                          subtitle: "Release Stress",
                          duration: "6 min",
                          desc:
                              "Let go of anxiety and prepare your mind for better memory retention.",
                          imageUrl:
                              "https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?q=80&w=2070&auto=format&fit=crop",
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

  Widget _buildJourneyCard({
    required String title,
    required String subtitle,
    required String duration,
    required String desc,
    required String imageUrl,
  }) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.2),
            BlendMode.darken,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Stack(
          children: [
            // Dark Gradient Overlay for text readability
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withValues(alpha: 0.8),
                    Colors.white.withValues(alpha: 0.9),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: customText(
                      text: title,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.charcoal,
                    ),
                  ),
                  verticalSpacer(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText(
                        text: subtitle,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.teal,
                      ),
                      horizontalSpacer(width: 12),
                      customText(
                        text: "Duration: $duration",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppColors.charcoal,
                      ),
                    ],
                  ),
                  verticalSpacer(height: 12),
                  customText(
                    text: desc,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.charcoal,
                    textAlign: TextAlign.center,
                    maxLine: 3,
                  ),
                  const Spacer(),
                  Container(
                    width: 42.w,
                    height: 42.w,
                    decoration: const BoxDecoration(
                      color: AppColors.teal,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 28.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
