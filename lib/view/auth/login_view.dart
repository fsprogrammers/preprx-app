import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/services/validation_services.dart';
import 'package:preprx/utils/app_routes.dart';
import 'package:preprx/utils/app_toast.dart';
import 'package:preprx/view_model/auth/auth_view_model.dart';
import '../../components/custom_button.dart';
import '../../components/custom_checkbox.dart';
import '../../components/custom_text.dart';
import '../../components/custom_textfield.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLoginPressed() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final ok = await ref
        .read(authViewModelProvider.notifier)
        .login(email: _emailController.text, password: _passwordController.text);

    if (!mounted) return;

    final state = ref.read(authViewModelProvider);
    if (ok) {
      final message = state.loginResponse?.message.isNotEmpty == true
          ? state.loginResponse!.message
          : 'Login successful';

           CustomToast.success(msg: message);

      goRouter.go(AppRoutes.studyOption);
      return;
    }

    final error = (state.errorMessage ?? 'Unable to login')
        .replaceFirst('Exception: ', '')
        .replaceFirst('FetchDataException: ', '')
        .trim();

           CustomToast.error(msg: error);


  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                  // Logo Box
                  ClipRRect(borderRadius: BorderRadiusGeometry.circular(12.r),
                 
                   child: Image.asset(AppImages.splash, fit: BoxFit.cover,width: 85.w,height: 100.h,)),


                  verticalSpacer(height: 25),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Column(
                      children: [
                        customText(
                          text: "Welcome Back",
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColors.charcoal,
                        ),
                        verticalSpacer(height: 6),
                        customText(
                          text:
                              "Master clinical concepts with smarter, guided learning.",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.bodytext,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  verticalSpacer(height: 25),


                  CustomTextField(
                    controller: _emailController,
                    width: double.infinity,
                    hintText: "mail",
                    hintFontSize: 16,
                    validator: ValidationService.instance.email,
                    prefixIcon: Icons.mail_outline,
                    borderColor: Colors.transparent,
                    fillColor: Colors.white,
                    borderRadius: 16,
                  ),
                  verticalSpacer(height: 12),

                  CustomTextField(
                    controller: _passwordController,
                    width: double.infinity,
                    hintText: "password",
                    hintFontSize: 16,
                    validator: ValidationService.instance.password,
                    prefixIcon: Icons.lock_outline,
                    isPasswordField: true,
                    borderColor: Colors.transparent,
                    fillColor: Colors.white,
                    borderRadius: 16,
                  ),
               
                  verticalSpacer(height: 12),

                  // Remember Me
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        width: 24.w,
                        height: 24.h,
                        child: CustomCheckBox(
                          value: _rememberMe,
                          onChanged: (val) {
                            setState(() {
                              _rememberMe = val ?? false;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 8.w),
                      customText(
                        text: "Remember Me",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.charcoal, 
                      ),
                    ],
                  ),

                  verticalSpacer(height: 20),

                  // Sign up Button
                  customButton(
                    context: context,
                    text: "Login",
                    fontSize: 16,
                    isLoading: authState.isLoading,
                    height: 52,
                    borderColor: Colors.transparent,
                    bgColor: AppColors.gold,
                    fontColor: AppColors.charcoal,
                    borderRadius: 20,
                    isCircular: false,
                    fontWeight: FontWeight.w600,
                    onPressed: _onLoginPressed,
              
                  ),

                  verticalSpacer(height: 16),

                  // Google Button
                  customButtonWithPrefixIcon(
                    context: context,
                    text: "Continue with Google",
                    fontSize: 16,
                    height: 52,
                    borderColor: Colors.transparent,
                    bgColor: Colors.white,
                    fontColor: AppColors.charcoal,
                    borderRadius: 30,
                    isCircular: false,
                    fontWeight: FontWeight.w600,
                    widget: SvgPicture.asset(AppImages.google),
                    onPressed: () {},
                  ),

                  verticalSpacer(height: 20),

                  // Login Text
                  GestureDetector(
                    onTap: () {
                      goRouter.go(AppRoutes.register);
                    },
                    child: customRichText(
                      textAlign: TextAlign.center,

                      textSpans: [
                        TextSpan(
                          text: "Don’t have an account? ",
                          style: GoogleFonts.poppins(
                            color: AppColors.charcoal,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "Sign up",
                          style: GoogleFonts.poppins(
                            color: AppColors.charcoal,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  verticalSpacer(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
