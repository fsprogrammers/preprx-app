import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_toplogo.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_routes.dart';
import 'package:preprx/view/home/widget/icon_button.dart';

Widget customAppBar({
  bool? isBack,
  bool? isSearch = true,
  bool? isProfile = true,
  bool? isLogo = true,
}) {
  return // Custom Top App Bar
  Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left icons (Menu and Search)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Builder(
                builder: (context) {
                  return iconButton(
                    icon: AppImages.drawer,
                    onPressed: () {
                      if (Scaffold.of(context).hasDrawer) {
                        Scaffold.of(context).openDrawer();
                      }
                    },
                    containerHeight: 32,
                    containerWidth: 32,
                    width: 18,
                    height: 12,
                  );
                },
              ),
              horizontalSpacer(width: 6),
              isSearch == true
                  ? iconButton(
                      containerHeight: 32,
                      containerWidth: 32,
                      icon: AppImages.search,
                      onPressed: () {},
                      width: 18,
                      height: 18,
                    )
                  : SizedBox.shrink(),
            ],
          ),
          Spacer(),

          // Center Logo
          isLogo == true ? customTopLogo() : SizedBox.shrink(),
          Spacer(),
          // Right icon (Profile)
          isProfile == true
              ? iconButton(
                  icon: AppImages.person,
                  onPressed: () {
                    goRouter.push(AppRoutes.profile);
                  },
                  containerHeight: 32,
                  containerWidth: 32,
                  width: 18,
                  height: 18,
                )
              : SizedBox.shrink(),
        ],
      ),
      isLogo == false ? verticalSpacer(height: 16) : SizedBox.shrink(),
      isBack == true
          ? InkWell(
              onTap: () {
                goRouter.pop();
              },
              borderRadius: BorderRadius.circular(8.r),
              child: SvgPicture.asset(
                AppImages.back,
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            )
          : SizedBox.shrink(),
    ],
  );
}
