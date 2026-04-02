import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';

class StrategyZoneEliminationView extends StatefulWidget {
  const StrategyZoneEliminationView({super.key});

  @override
  State<StrategyZoneEliminationView> createState() =>
      _StrategyZoneEliminationViewState();
}

class _StrategyZoneEliminationViewState
    extends State<StrategyZoneEliminationView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      // Header Box
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 24.h,
                          horizontal: 12.w,
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
                              text: "Elimination Techniques",
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: AppColors.charcoal,
                              textAlign: TextAlign.center,
                            ),
                            verticalSpacer(height: 12),
                            customText(
                              text:
                                  "Use these formulas to quickly rank patient needs and choose the best action",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.bodytext,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      verticalSpacer(height: 16),

                      // Carousel Container
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            children: [
                              _buildSlide1(),
                              _buildSlide2(),
                              _buildSlide2(),
                              _buildSlide2(),

                              // _buildSlidePlaceholder("3/5: Placeholder Title"),
                              // _buildSlidePlaceholder("4/5: Placeholder Title"),
                            ],
                          ),
                        ),
                      ),

                      verticalSpacer(height: 32),

                      // Page Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 6.w),
                            width: 12.w,
                            height: 12.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? AppColors.indigo
                                  : Colors.white,
                            ),
                          );
                        }),
                      ),

                      // Bottom padding
                      verticalSpacer(height: 48),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlide1() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: customText(
              text: "1/5: Avoid Absolute Words",
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.charcoal,
              textAlign: TextAlign.center,
            ),
          ),
          verticalSpacer(height: 16),
          Center(
            child: customText(
              text: 'e.g "ALWAYS" "NEVER" "MUST" "ALL" "NONE"',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.teal,
              textAlign: TextAlign.center,
            ),
          ),
          verticalSpacer(height: 16),
          customText(
            text: "Nursing care is rarely absolute or definitive",
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.bodytext,
            maxLine: 3,
          ),
          verticalSpacer(height: 16),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14.sp,
                height: 1.5,
                color: AppColors.bodytext,
              ),
              children: [
                TextSpan(
                  text: "Think: ",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: AppColors.charcoal,
                  ),
                ),
                TextSpan(
                  text:
                      "are there any exceptions? if so the absolute answer is wrong",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.bodytext,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlide2() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: customText(
              text: "Don't add extra steps",
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.charcoal,
              textAlign: TextAlign.center,
            ),
          ),
          verticalSpacer(height: 32),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14.sp,
                height: 1.5,
                color: AppColors.bodytext,
              ),
              children: [
                TextSpan(
                  text: "Explanation: ",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: AppColors.charcoal,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text:
                      "Avoid choices that add complex steps, the correct answer is usually without waiting an order or nursing action",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.bodytext,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
    }