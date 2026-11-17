import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_text_field.dart';
import 'package:eureka/core/design_system/widgets/text/app_text.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/auth/presentation/screens/forgot_password/widgets/auth_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  bool _isLoading = false;
  bool _emailHasError = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSendCode() {
    final isValid = _formKey.currentState!.validate();
    setState(() {
      _emailHasError = !_isEmailValid();
    });

    if (!isValid) return;

    setState(() => _isLoading = true);

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => _isLoading = false);
        context.push(
          AppRoutes.otpVerificationScreen,
          extra: _emailController.text.trim().isNotEmpty
              ? _emailController.text.trim()
              : 'ahmed@gmail.com',
        );
      }
    });
  }

  bool _isEmailValid() {
    final value = _emailController.text.trim();
    if (value.isEmpty) return false;
    return RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.space24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(AppSpacing.space16.h),

                // ── Top Back Button ────────────────────────────────────
                const AuthBackButton(),

                Gap(AppSpacing.space8.h),

                // ── Illustration ───────────────────────────────────────
                SizedBox(
                  height: 240.h,
                  child: Image.asset(
                    'assets/images/bro.png',
                    fit: BoxFit.contain,
                  ),
                ),

                Gap(AppSpacing.space16.h),

                // ── Title ──────────────────────────────────────────────
                AppText(
                  'نسيت كلمه المرور',
                  style: AppTextStyles.headlineMedium.copyWith(
                    fontFamily: AppTextStyles.headingFontFamilyArabic,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),

                Gap(AppSpacing.space8.h),

                // ── Subtitle ───────────────────────────────────────────
                AppText(
                  'سنرسل لك رمز التحقق علي بريدك الالكتروني\nللتحقق من هويتك',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontFamily: AppTextStyles.bodyFontFamilyArabic,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),

                Gap(AppSpacing.space32.h),

                // ── Email Input Field ──────────────────────────────────
                AppTextField(
                  controller: _emailController,
                  label: 'البريد الالكتروني',
                  hintText: 'ادخل بريدك الالكتروني',
                  type: AppTextFieldType.email,
                  textInputAction: TextInputAction.done,
                  prefixIcon: const Icon(
                    Icons.mail_outline_rounded,
                    color: AppColors.textSecondary,
                  ),
                  suffixIcon: _emailHasError
                      ? const Icon(
                          Icons.error_rounded,
                          color: AppColors.error,
                        )
                      : null,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'يرجي ادخال بريد الكتروني صحيح';
                    }
                    final emailRegex =
                        RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'يرجي ادخال بريد الكتروني صحيح';
                    }
                    return null;
                  },
                ),

                Gap(AppSpacing.space32.h),

                // ── Submit Button ──────────────────────────────────────
                AppButton(
                  text: 'ارسال رمز التحقق',
                  isLoading: _isLoading,
                  onPressed: _onSendCode,
                  backgroundColor: AppColors.success,
                  foregroundColor: AppColors.white,
                  textStyle: AppTextStyles.titleMedium.copyWith(
                    fontFamily: AppTextStyles.bodyFontFamilyArabic,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Gap(AppSpacing.space32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
