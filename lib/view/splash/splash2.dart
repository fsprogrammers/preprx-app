import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_routes.dart';
import 'package:preprx/view/splash/widget/build_tile_container.dart';
import '../../components/custom_text.dart';
import '../../components/custom_button.dart';
import '../../utils/app_assets.dart';

class SplashView2 extends StatelessWidget {
  const SplashView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: customButton(
            context: context,
            text: "Continue",
            fontSize: 16,
            height: 52,
            borderColor: Colors.transparent,
            bgColor: AppColors.gold,
            fontColor: AppColors.charcoal,
            borderRadius: 25,
            isCircular: true,
            fontWeight: FontWeight.w600,
            onPressed: () {
              goRouter.push(AppRoutes.register);
            },
          ),
        ),
      ),
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              verticalSpacer(height: 30),

              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12.r),

                child: Image.asset(
                  AppImages.splash,
                  fit: BoxFit.cover,
                  width: 122.w,
                  height: 130.h,
                ),
              ),

              Expanded(
                child: Center(
                  child: SizedBox(
                    width: 320.w,
                    height: 320.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 85.h,
                          left: 25.sp,
                          child: Transform.rotate(
                            angle: 0.08, // slight downward tilt
                            child: buildTiltedContainer(
                              "All topics",
                              AppColors.teal,
                            ),
                          ),
                        ),

                        // Behavioral Health RX (Middle front layer)
                        Positioned(
                          top: 160.h,
                          right: 20.sp,
                          child: Transform.rotate(
                            angle: -0.18, // slight upward tilt
                            child: buildTiltedContainer(
                              "Behavioral Health RX",
                              AppColors.indigo,
                            ),
                          ),
                        ),
                        // Priority Practice (front layer)
                        Positioned(
                          top: 234.h,
                          left: 30.sp,
                          child: Transform.rotate(
                            angle: 0.01, // very slight downward tilt
                            child: buildTiltedContainer(
                              "Priority Practice",
                              AppColors.magenta,
                            ),
                          ),
                        ),

                        // Custom Quizzes (Top front layer)
                        Positioned(
                          top: 15.h,
                          left: 30.sp,
                          child: Transform.rotate(
                            angle: -0.15, // slight upward tilt
                            child: buildTiltedContainer(
                              "Custom Quizzes",
                              AppColors.gold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Info Box
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 8.sp,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: customText(
                      text:
                          "Prep Smarter. Manifest Stronger. Pass with Confidence.",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.charcoal,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              verticalSpacer(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
