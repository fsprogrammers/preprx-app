import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.indigo,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // White header with logo
            Container(
              height: 76.h,
              width: double.infinity,
              color: Colors.white,
              // padding: EdgeInsets.symmetric(vertical: 24.h),
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.splash,
                height: 76.h,
                width: 72.w,
                fit: BoxFit.contain,
              ),
            ),

            verticalSpacer(height: 24),

            // Drawer Items List
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDrawerTile(
                        assetName: AppImages.calendar,
                        title: "Manifestation Calendar",
                        onTap: () {
                          goRouter.push(AppRoutes.manifestationCalendar);
                        },
                      ),
                      _buildDrawerTile(
                        assetName: AppImages.studyzone,
                        title: "Study Zone",
                        onTap: () {
                          goRouter.push(AppRoutes.studyZone);
                        },
                      ),
                      _buildDrawerTile(
                        assetName: AppImages.flagged,
                        title: "Flagged Questions",
                        onTap: () {
                          // goRouter.push(AppRoutes.studyZone);
                        },
                      ),
                      _buildDrawerTile(
                        assetName: AppImages.flash,
                        title: "Flash Cards",
                        onTap: () {
                          goRouter.push(AppRoutes.studyZoneFlashcards);
                        },
                      ),
                      _buildDrawerAssetTile(
                        assetPath: AppImages.dose,
                        title: "Resources Rx",
                        onTap: () {
                          goRouter.push(AppRoutes.resources);
                        },
                      ),
                      _buildDrawerTile(
                        assetName: AppImages.help,
                        title: "Help & Support",
                        onTap: () {},
                      ),
                      _buildDrawerTile(
                        assetName: AppImages.share,
                        title: "Share App",
                        onTap: () {},
                      ),

                      verticalSpacer(height: 64), // spacing before logout

                      _buildDrawerTile(
                        assetName: AppImages.logout,
                        title: "Log out",
                        onTap: () {},
                      ),

                      verticalSpacer(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerTile({
    required String assetName,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.white10,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          children: [
            SvgPicture.asset(assetName, width: 24.w),
            horizontalSpacer(width: 16),
            Expanded(
              child: customText(
                text: title,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerAssetTile({
    required String assetPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.white10,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          children: [
            SvgPicture.asset(
              assetPath,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              width: 28.sp,
              height: 28.sp,
            ),
            horizontalSpacer(width: 16),
            Expanded(
              child: customText(
                text: title,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
