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
import 'package:preprx/view/home/widget/build_card.dart';

class ScriptingSpaceView extends StatelessWidget {
  const ScriptingSpaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
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
                                text: "Scripting Space",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                              verticalSpacer(height: 8),
                              customText(
                                text: "Write your future into reality.",
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

                        // Writing Input Card
                        Container(
                          width: double.infinity,
                          height: 260.h,
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              TextField(
                                maxLines: 10,
                                decoration: InputDecoration(
                                  hintText:
                                      "Describe your feelings here, tap to start writing.",
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.bodytext.withValues(
                                      alpha: 0.6,
                                    ),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.charcoal,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 40.w,
                                  height: 40.w,
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.teal,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: SvgPicture.asset(
                                    AppImages.tick,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 32),

                        // Past Scripts Section
                        buildCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: "Your past Scripts",
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: AppColors.charcoal,
                              ),
                              verticalSpacer(height: 16),
                              _buildPastScriptCard(
                                context: context,
                                date: "22 Nov, 2025",
                                content:
                                    "I'm sitting here trying to organize my thoughts. There's a lot in my head, an...",
                              ),
                              verticalSpacer(height: 16),
                              _buildPastScriptCard(
                                context: context,
                                date: "22 Nov, 2025",
                                content:
                                    "I keep rewriting the first line, but I'm realizing that starting matters more t...",
                              ),
                              verticalSpacer(height: 16),
                              _buildPastScriptCard(
                                context: context,
                                date: "22 Nov, 2025",
                                content:
                                    "This space feels safe enough to be honest. I can admit what I don't know,...",
                              ),
                            ],
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

  Widget _buildPastScriptCard({
    required BuildContext context,
    required String date,
    required String content,
  }) {
    return GestureDetector(
      onTap: () => _showDeleteDialog(context, date, content),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.indigo,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
              text: date,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.white,
            ),
            verticalSpacer(height: 12),
            customText(
              text: content,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.white,
              maxLine: 2,
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, String date, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: AppColors.indigo,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  text: date,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white,
                ),
                verticalSpacer(height: 16),
                customText(
                  text: content,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.white,
                  maxLine: 10,
                ),
                verticalSpacer(height: 24),
                // Delete Button
                SizedBox(
                  width: 120.w,
                  child: customButton(
                    text: "Delete",
                    bgColor: AppColors.teal,
                    borderColor: AppColors.teal,
                    fontColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 36,
                    borderRadius: 20,
                    isCircular: false,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
