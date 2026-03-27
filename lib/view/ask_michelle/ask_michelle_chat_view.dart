import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';

class AskMichelleChatView extends StatefulWidget {
  const AskMichelleChatView({super.key});

  @override
  State<AskMichelleChatView> createState() => _AskMichelleChatViewState();
}

class _AskMichelleChatViewState extends State<AskMichelleChatView> {
  final TextEditingController _msgController = TextEditingController();

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
                  isProfile: false,
                ),
              ),

              verticalSpacer(height: 16),

              // Michelle Title Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: customText(
                    text: "Michelle",
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.charcoal,
                  ),
                ),
              ),

              verticalSpacer(height: 24),

              // Chat Area
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: ListView(
                    children: [
                      // Date Badge
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.h,
                            horizontal: 20.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: customText(
                            text: "Today",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColors.bodytext,
                          ),
                        ),
                      ),

                      verticalSpacer(height: 24),

                      // Michelle Message
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.75,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 16.h,
                            horizontal: 20.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(26.r),
                              topRight: Radius.circular(26.r),
                              bottomRight: Radius.circular(26.r),
                              bottomLeft: Radius.zero,
                            ),
                          ),
                          child: customText(
                            text: "Good morning user! How can I help you?",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.charcoal,
                          ),
                        ),
                      ),

                      verticalSpacer(height: 24),

                      // User Avatar
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: CircleAvatar(
                            radius: 26.r,
                            backgroundColor: AppColors.primaryGrey,
                            // Ideally an Image network/asset for user avatar
                            child: Icon(
                              Icons.person,
                              color: AppColors.white,
                              size: 30.sp,
                            ),
                          ),
                        ),
                      ),

                      // User Message
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.75,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 16.h,
                            horizontal: 20.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.indigo, // Dark blue background
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(26.r),
                              topRight: Radius.zero,
                              bottomRight: Radius.circular(26.r),
                              bottomLeft: Radius.circular(26.r),
                            ),
                          ),
                          child: customText(
                            text:
                                "I want to know about the detail of above question, please explain it to me",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // Spacer to ensure nothing overlaps with input field
                      verticalSpacer(height: 20),
                    ],
                  ),
                ),
              ),

              // Input Area
              Container(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                  top: 16.h,
                  bottom: 32.h,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _msgController,
                                style: TextStyle(
                                  color: AppColors.indigo,
                                  fontSize: 14.sp,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Type something...",
                                  hintStyle: TextStyle(
                                    color: AppColors.indigo.withValues(
                                      alpha: 0.6,
                                    ),
                                    fontSize: 14.sp,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 18.h,
                                  ),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.attach_file,
                              color: AppColors.indigo,
                              size: 20.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                    horizontalSpacer(width: 12),
                    InkWell(
                      onTap: () {
                        // Send logic here
                      },
                      child: Container(
                        width: 56.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.send,
                          color: AppColors.teal,
                          size: 24.sp,
                        ),
                      ),
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
}
