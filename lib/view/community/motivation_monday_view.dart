import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/view/home/widget/build_card.dart';

class MotivationMondayView extends StatelessWidget {
  const MotivationMondayView({super.key});

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
              verticalSpacer(height: 24),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          children: [
                            // Header Card
                            buildCard(
                              child: Column(
                                children: [
                                  customText(
                                    text: "Motivation Monday",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    color: AppColors.charcoal,
                                    textAlign: TextAlign.center,
                                  ),
                                  verticalSpacer(height: 8),
                                  customText(
                                    text: "Monday, November 18, 2025",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: const Color(0xFF0C4866),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            verticalSpacer(height: 24),

                            // Feed
                            _buildFeedItem(
                              context: context,
                              name: "RN Sarah L,",
                              content:
                                  "Starting my week win! Passed my med-surg today",
                              likes: 45,
                              comments: 7,
                              avatarUrl:
                                  "https://images.unsplash.com/photo-1594824476967-48c8b964273f?q=80&w=1974&auto=format&fit=crop",
                            ),
                            verticalSpacer(height: 20),
                            _buildFeedItem(
                              context: context,
                              name: "RN Sarah L,",
                              content:
                                  "Starting my week win! Passed my med-surg today",
                              likes: 45,
                              comments: 7,
                              avatarUrl:
                                  "https://images.unsplash.com/photo-1594824476967-48c8b964273f?q=80&w=1974&auto=format&fit=crop",
                            ),
                            verticalSpacer(height: 20),
                            _buildFeedItem(
                              context: context,
                              name: "RN Sarah L,",
                              content:
                                  "Starting my week win! Passed my med-surg today",
                              likes: 45,
                              comments: 7,
                              avatarUrl:
                                  "https://images.unsplash.com/photo-1594824476967-48c8b964273f?q=80&w=1974&auto=format&fit=crop",
                            ),

                            // Spacer for bottom bar
                            verticalSpacer(height: 120),
                          ],
                        ),
                      ),
                    ),

                    // Bottom Post Bar
                    Positioned(
                      bottom: 20.h,
                      left: 24.w,
                      right: 24.w,
                      child: _buildBottomPostBar(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeedItem({
    required BuildContext context,
    required String name,
    required String content,
    required int likes,
    required int comments,
    required String avatarUrl,
  }) {
    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 12.sp,
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              customText(
                text: name,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: const Color(0xFF0C4866),
              ),
            ],
          ),
          verticalSpacer(height: 16),
          customText(
            text: content,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: const Color(0xFF0C4866),
            maxLine: 3,
          ),
          verticalSpacer(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 8.sp,
                children: [
                  SvgPicture.asset(
                    AppImages.favourite,
                    width: 24.w,
                    height: 24.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.teal,
                      BlendMode.srcIn,
                    ),
                  ),
                  customText(
                    text: "$likes likes",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color(0xFF0C4866),
                  ),
                ],
              ),
              InkWell(
                onTap: () => _showCommentsBottomSheet(context),
                child: Row(
                  spacing: 8.sp,
                  children: [
                    SvgPicture.asset(
                      AppImages.message,
                      width: 24.w,
                      height: 24.h,
                      colorFilter: const ColorFilter.mode(
                        AppColors.teal,
                        BlendMode.srcIn,
                      ),
                    ),
                    customText(
                      text: "$comments comments",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xFF0C4866),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showCommentsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Centered handle
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                verticalSpacer(height: 24),

                // Comments List
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 24.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12.sp,
                          children: [
                            CircleAvatar(
                              radius: 18.r,
                              backgroundImage: const NetworkImage(
                                "https://images.unsplash.com/photo-1594824476967-48c8b964273f?q=80&w=1974&auto=format&fit=crop",
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                  text: "RN Sarah L,",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: const Color(0xFF0C4866),
                                ),
                                verticalSpacer(height: 4),
                                customText(
                                  text: "Congratulations",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: const Color(0xFF0C4866),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                verticalSpacer(height: 16),

                // Bottom Input
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: customText(
                          text: "Write comment",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xFF0C4866),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.teal,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: customText(
                          text: "Add",
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpacer(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomPostBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: customText(
              text: "Share your win!",
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: const Color(0xFF0C4866),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppImages.camera,
              width: 24.w,
              height: 24.h,
              colorFilter: const ColorFilter.mode(
                AppColors.teal,
                BlendMode.srcIn,
              ),
            ),
          ),
          horizontalSpacer(width: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.teal,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: customText(
              text: "Post",
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
