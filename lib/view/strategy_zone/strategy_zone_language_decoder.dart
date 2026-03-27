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

class StrategyZoneLanguageDecoderView extends StatelessWidget {
  const StrategyZoneLanguageDecoderView({super.key});

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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              customText(
                                text: "NCLEX Language\nDecoder",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                              verticalSpacer(height: 12),
                              customText(
                                text:
                                    "Understand tricky NCLEX wording\ninstantly",
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

                        // List of items
                        _buildDecoderCard(
                          iconData: AppImages.hintBulb, // fallback for siren
                          title: "Immediate action",
                          meaning: "Threat to life",
                        ),
                        verticalSpacer(height: 16),

                        _buildDecoderCard(
                          iconData: AppImages.close,
                          title: "Further teaching",
                          meaning: "The patient is wrong",
                        ),
                        verticalSpacer(height: 16),

                        _buildDecoderCard(
                          iconData: AppImages.like,
                          title: "Best response",
                          meaning: "The patient is safe",
                        ),
                        verticalSpacer(height: 16),

                        _buildDecoderCard(
                          iconData: AppImages.lungs,
                          title: "First Aid",
                          meaning: "ABCs",
                        ),
                        verticalSpacer(height: 16),

                        _buildDecoderCard(
                          iconData: AppImages
                              .warning, // fallback for warning triangle
                          title: "Unexpected finding",
                          meaning: "dangerous condition",
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

  Widget _buildDecoderCard({
    required dynamic iconData,
    required String title,
    required String meaning,
  }) {
    // child could be SvgPicture for string path, Icon for IconData
    Widget iconWidget;
    if (iconData is String) {
      iconWidget = SvgPicture.asset(
        iconData,
        width: 24.w,
        height: 24.h,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      );
    } else {
      iconWidget = Icon(iconData, color: Colors.white, size: 24.w);
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
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
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: AppColors.teal,
              borderRadius: BorderRadius.circular(12.r),
            ),
            alignment: Alignment.center,
            child: iconWidget,
          ),
          verticalSpacer(height: 16),
          customText(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.charcoal,
          ),
          verticalSpacer(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customText(
                text: "Real meaning",
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.bodytext,
              ),
              Expanded(
                child: customText(
                  text: meaning,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.indigo,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
