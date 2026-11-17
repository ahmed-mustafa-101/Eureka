import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/auth/presentation/screens/login_screen/widgets/auth_header.dart';
import 'package:eureka/features/auth/presentation/screens/login_screen/widgets/dont_have_account_widget.dart';
import 'package:eureka/features/auth/presentation/screens/login_screen/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onForgotPassword(BuildContext context) {
    context.push(AppRoutes.forgotPasswordScreen);
  }

  void _onRegister(BuildContext context) {
    context.push(AppRoutes.registerScreen);
  }

  void _onLoginSuccess(BuildContext context) {
    // TODO: navigate to home screen
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
                title: 'مرحبا بك في يوريكا',
                subtitle: 'سجل دخولك لمتابعه رحلتك التعليميه',
              ),

              Gap(AppSpacing.space32.h),

              // ── Form (Fields + Forgot Password + Submit Button) ──────────
              LoginForm(
                onForgotPassword: () => _onForgotPassword(context),
                onLoginSuccess: () => _onLoginSuccess(context),
              ),

              Gap(AppSpacing.space24.h),

              // ── Footer (Don't have an account link) ─────────────────────
              DontHaveAccountWidget(
                onRegisterTap: () => _onRegister(context),
              ),

              Gap(AppSpacing.space32.h),
            ],
          ),
        ),
      ),
    );
  }
}
