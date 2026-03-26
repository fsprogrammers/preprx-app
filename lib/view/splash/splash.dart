import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
     goRouter.go(AppRoutes.splash2);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Image.asset(
              AppImages.splash,
              fit: BoxFit.cover,
              width: 280.w,
              height: 297.h,
            ),
            verticalSpacer(height: 40),
            customText(
              text: "PREP RX",
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: AppColors.charcoal,
            ),
            customText(
              text: "Your Prescription for Success",
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.charcoal,
            ),
          ],
        ),
      ),
    );
  }
}
