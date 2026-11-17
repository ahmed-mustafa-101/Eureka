import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/auth/presentation/screens/register_screen/widgets/already_have_account_widget.dart';
import 'package:eureka/features/auth/presentation/screens/login_screen/widgets/auth_header.dart';
import 'package:eureka/features/auth/presentation/screens/register_screen/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  void _onLoginTap(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.loginScreen);
    }
  }

  void _onRegisterSuccess(BuildContext context) {
    // TODO: Navigate to home / verification screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.space24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(AppSpacing.space40.h),

              // ── Header (Logo + Title + Subtitle) ────────────────────────
              const AuthHeader(
                title: 'انشاء حساب جديد',
                subtitle: 'انضم الي مجتمعنا التعليمي وابدا\nرحلتك نحو التعلم والتطور',
              ),

              Gap(AppSpacing.space32.h),

              // ── Form (Inputs + Submit Button) ───────────────────────────
              RegisterForm(
                onRegisterSuccess: () => _onRegisterSuccess(context),
              ),

              Gap(AppSpacing.space24.h),

              // ── Footer (Already have an account link) ────────────────────
              AlreadyHaveAccountWidget(
                onLoginTap: () => _onLoginTap(context),
              ),

              Gap(AppSpacing.space32.h),
            ],
          ),
        ),
      ),
    );
  }
}
