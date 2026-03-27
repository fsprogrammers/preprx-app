import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_button.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_routes.dart';
import 'package:preprx/utils/app_colors.dart';

class AskMichelleView extends StatelessWidget {
  const AskMichelleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpacer(height: 10),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: customAppBar(
                  isBack: true,
                  isSearch: false,
                  isProfile: false,
                  isLogo: false,
                ),
              ),

              verticalSpacer(height: 80),

              Container(
                width: 174.w,
                height: 184.h,
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26.r),
                ),
                child: Image.asset(AppImages.splash, fit: BoxFit.contain),
              ),

              verticalSpacer(height: 48),

              customText(
                text: "Hello!",
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: AppColors.indigo,
                textAlign: TextAlign.center,
              ),

              verticalSpacer(height: 16),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 48.w),
                child: customText(
                  text: "My name is Michelle and I\nam here to help you",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.charcoal,
                  textAlign: TextAlign.center,
                ),
              ),

              verticalSpacer(height: 56),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: customButton(
                  text: "Ask Michelle",
                  fontSize: 16,
                  height: 54,
                  width: double.infinity,
                  borderColor: AppColors.gold,
                  bgColor: AppColors.gold,
                  fontColor: AppColors.charcoal,
                  borderRadius: 20,
                  isCircular: true,
                  fontWeight: FontWeight.w600,
                  onPressed: () {
                    goRouter.push(AppRoutes.askMichelleChat);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
