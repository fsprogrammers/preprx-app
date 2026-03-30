import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/view/home/widget/build_card.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _obscurePassword = true;

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
                child: customAppBar(
                  isBack: true,
                  isProfile: true,
                  isSearch: false,
                ),
              ),
              verticalSpacer(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: Column(
                      children: [
                        // Main Profile Card
                        buildCard(
                          child: Column(
                            children: [
                              customText(
                                text: "My Profile",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                              ),
                              verticalSpacer(height: 24),

                              // Avatar Section
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.teal,
                                        width: 2,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: 60.r,
                                      backgroundImage: const NetworkImage(
                                        "https://i.pravatar.cc/300?u=sarah",
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 4.w,
                                    child: Container(
                                      padding: EdgeInsets.all(8.w),
                                      decoration: const BoxDecoration(
                                        color: AppColors.charcoal,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.edit_outlined,
                                        color: Colors.white,
                                        size: 20.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpacer(height: 16),
                              customText(
                                text: "Sarah M.",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: AppColors.charcoal,
                              ),
                              verticalSpacer(height: 32),

                              // Input Fields
                              _buildProfileField(
                                "user name",
                                Icons.person_outline,
                              ),
                              _buildProfileField("mail", Icons.mail_outline),
                              _buildProfileField(
                                "password",
                                Icons.lock_outline,
                                isPassword: true,
                              ),
                              verticalSpacer(height: 12),
                            ],
                          ),
                        ),
                        verticalSpacer(height: 40),

                        // Edit Profile Button
                        SizedBox(
                          width: double.infinity,
                          height: 64.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.gold,
                              foregroundColor: AppColors.charcoal,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            child: customText(
                              text: "Edit Profile",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
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

  Widget _buildProfileField(
    String label,
    IconData icon, {
    bool isPassword = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: TextFormField(
        obscureText: isPassword && _obscurePassword,
        style: TextStyle(
          color: AppColors.charcoal,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(
            color: AppColors.bodytext.withValues(alpha: 0.6),
            fontSize: 16.sp,
          ),
          prefixIcon: Icon(icon, color: AppColors.charcoal, size: 24.sp),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                )
              : null,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.charcoal),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.teal, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
