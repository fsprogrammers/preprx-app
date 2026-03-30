import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/view/home/widget/build_card.dart';

class AddAffirmationView extends StatefulWidget {
  const AddAffirmationView({super.key});

  @override
  State<AddAffirmationView> createState() => _AddAffirmationViewState();
}

class _AddAffirmationViewState extends State<AddAffirmationView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: customAppBar(isSearch: false, isBack: true),
              ),
              verticalSpacer(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: Column(
                      children: [
                        // Header Card
                        buildCard(
                          child: Column(
                            children: [
                              customText(
                                text: "Manifestation Calendar",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 8),
                              customText(
                                text: "Small daily moments that shift your mindset.",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                            ],
                          ),
                        ),
                        verticalSpacer(height: 24),

                        // Input Card
                        Container(
                          width: double.infinity,
                          height: 300.h,
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(26.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _controller,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: "Tap here to type your affirmation",
                              hintStyle: TextStyle(
                                color: AppColors.bodytext.withValues(alpha: 0.5),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: AppColors.bodytext,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        verticalSpacer(height: 32),

                        // Save Button
                        SizedBox(
                          width: double.infinity,
                          height: 60.h,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.gold,
                              foregroundColor: AppColors.charcoal,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            child: customText(
                              text: "Save",
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: AppColors.charcoal,
                            ),
                          ),
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
}
