import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_toplogo.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_routes.dart';
import 'package:preprx/view/home/widget/icon_button.dart';

Widget customAppBar({bool? isBack}) {
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
              iconButton(
                icon: AppImages.drawer,
                onPressed: () {},
                containerHeight: 32,
                containerWidth: 32,
                width: 18,
                height: 12,
              ),
              horizontalSpacer(width: 6),
              iconButton(
                containerHeight: 32,
                containerWidth: 32,
                icon: AppImages.search,
                onPressed: () {},
                width: 18,
                height: 18,
              ),
            ],
          ),
          Spacer(),

          // Center Logo
          customTopLogo(),
          Spacer(),
          // Right icon (Profile)
          iconButton(
            icon: AppImages.person,
            onPressed: () {},
            containerHeight: 32,
            containerWidth: 32,
            width: 18,
            height: 18,
          ),
        ],
      ),
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
