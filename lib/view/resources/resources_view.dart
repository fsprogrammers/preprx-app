import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/view/home/widget/build_card.dart';

class ResourcesView extends StatefulWidget {
  const ResourcesView({super.key});

  @override
  State<ResourcesView> createState() => _ResourcesViewState();
}

class _ResourcesViewState extends State<ResourcesView> {
  String selectedCategory = "All";
  final List<String> categories = [
    "All",
    "Cheat Sheets",
    "Study planner",
    "Care Maps",
  ];

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: customAppBar(isSearch: true, isProfile: true),
              ),
              verticalSpacer(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: Column(
                      children: [
                        // Resource RX Title Card
                        buildCard(
                          child: Column(
                            children: [
                              customText(
                                text: "Resource RX",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                              ),
                              customText(
                                text: "Prescriptions for Growth",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                              ),
                            ],
                          ),
                        ),
                        verticalSpacer(height: 24),

                        // Categories Scroll
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: categories.map((cat) {
                              bool isSelected = selectedCategory == cat;
                              return Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: InkWell(
                                  onTap: () =>
                                      setState(() => selectedCategory = cat),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 8.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? AppColors.charcoal
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: customText(
                                      text: cat,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: isSelected
                                          ? Colors.white
                                          : AppColors.teal,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        verticalSpacer(height: 24),

                        // Social Card
                        buildCard(
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14.sp,
                                  color: AppColors.charcoal,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  const TextSpan(text: "Follow us on "),
                                  TextSpan(
                                    text: "TikTok, ",
                                    style: TextStyle(color: AppColors.magenta),
                                  ),
                                  TextSpan(
                                    text: "Instagram, ",
                                    style: TextStyle(color: AppColors.magenta),
                                  ),
                                  TextSpan(
                                    text: "YouTube",
                                    style: TextStyle(color: AppColors.magenta),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        verticalSpacer(height: 24),

                        // Resource Items
                        _buildResourceCard(
                          "Study Planner",
                          "Plan your week, track goals",
                          "Download",
                        ),
                        verticalSpacer(height: 16),
                        _buildResourceCard(
                          "Cheat Sheets",
                          "Quick reference guides for NCLEX prep",
                          "Download",
                        ),
                        verticalSpacer(height: 16),
                        _buildResourceCard(
                          "Care Maps",
                          "Visual guides for patient care planning",
                          "Download",
                        ),
                        verticalSpacer(height: 16),
                        _buildResourceCard(
                          "Affiliate Tie-Ins",
                          "Books, flashcards, study kits",
                          "Buy Now",
                        ),
                        verticalSpacer(height: 16),
                        _buildResourceCard(
                          "Affiliate Tie-Ins",
                          "Books, flashcards, study kits",
                          "Buy Now",
                        ),
                        verticalSpacer(height: 120),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResourceCard(String title, String subtitle, String buttonLabel) {
    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.charcoal,
          ),
          verticalSpacer(height: 4),
          customText(
            text: subtitle,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.bodytext,
          ),
          verticalSpacer(height: 16),
          SizedBox(
            width: 130.w,
            height: 40.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.teal,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              child: customText(
                text: buttonLabel,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
