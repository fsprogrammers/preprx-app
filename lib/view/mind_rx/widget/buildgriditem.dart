
  import 'package:flutter/material.dart';
import 'package:preprx/components/custom_buildtile_icon.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/view/home/widget/build_card.dart';

Widget buildGridItem({
    required String icon,
    required String title,
    required String desc,
    VoidCallback? onTap,
  }) {
    return buildCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTealIconBox(icon),
          verticalSpacer(height: 12),
          customText(
            text: title,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: AppColors.charcoal,
            maxLine: 2,
          ),
          verticalSpacer(height: 8),
          customText(
            text: desc,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.bodytext,
            maxLine: 2,
          ),
        ],
      ),
    );
  }

