import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/view/home/home_view.dart';
import 'package:preprx/view/strategy_zone/strategy_zone_view.dart';
import 'package:preprx/view/study_zone/study_zone_view.dart';

import 'package:preprx/view/community/community_view.dart';
import 'package:preprx/view/mind_rx/mind_rx_view.dart';

class HostView extends StatefulWidget {
  const HostView({super.key});

  @override
  State<HostView> createState() => _HostViewState();
}

class _HostViewState extends State<HostView> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const StudyZoneView(), // Study Zone
    const StrategyZoneView(), // Strategy Zone placeholder
    const CommunityView(), // Community View
    const MindRxView(), // Mind Rx view
    const SizedBox(), // Progress placeholder
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 24.h, top: 12.h),
        decoration: BoxDecoration(
          color: AppColors.teal,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildNavItem(
                AppImages.homeFill,
                AppImages.homeOutline,
                "Home",
                0,
              ),
              _buildNavItem(
                AppImages.studyZoneFill,
                AppImages.studyZoneOutline,
                "Study zone",
                1,
              ),
              _buildNavItem(
                AppImages.strategyZoneFill,
                AppImages.strategyZoneOutline,
                "Strategy zone",
                2,
              ),
              _buildNavItem(
                AppImages.communityFill,
                AppImages.communityOutline,
                "Community",
                3,
              ),
              _buildNavItem(
                AppImages.mindRxFill,
                AppImages.mindRxOutline,
                "Mind Rx",
                4,
              ),
              _buildNavItem(
                AppImages.progressFill,
                AppImages.progressOutline,
                "Progress",
                5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    String fillAsset,
    String outlineAsset,
    String label,
    int index,
  ) {
    bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isSelected ? fillAsset : outlineAsset,
            width: isSelected ? 24.w : 18.w,
            height: isSelected ? 24.h : 18.h,
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.gold : Colors.white,
              BlendMode.srcIn,
            ),
          ),
          if (isSelected) ...[
            SizedBox(height: 4.h),
            Text(
              label,
              style: GoogleFonts.inter(
                color: AppColors.gold,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
