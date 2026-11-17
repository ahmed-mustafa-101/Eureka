import 'dart:async';

import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/design_system/widgets/text/app_text.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/auth/presentation/screens/forgot_password/widgets/auth_back_button.dart';
import 'package:eureka/features/auth/presentation/screens/forgot_password/widgets/otp_input_field.dart';
import 'package:eureka/features/auth/presentation/screens/forgot_password/widgets/resend_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({
    super.key,
    this.email = 'ahmed@gmail.com',
  });

  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String _otpCode = '';
  bool _isLoading = false;
  bool _hasError = false;

  Timer? _timer;
  int _secondsRemaining = 59;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _secondsRemaining = 59;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        timer.cancel();
      }
    });
  }

  void _onVerify() {
    if (_otpCode.length < 6) {
      setState(() => _hasError = true);
      return;
    }

    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _isLoading = false);
        // تجربة محاكاة التحقق (إذا كان الرمز 111111 يُظهر خطأ كمثال مطابق للصورة 3)
        if (_otpCode == '111111') {
          setState(() => _hasError = true);
        } else {
          context.push(AppRoutes.resetPasswordScreen);
        }
      }
    });
  }

  void _onResendCode() {
    _startTimer();
    setState(() => _hasError = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تمت إعادة إرسال رمز التحقق بنجاح')),
    );
  }

  String get _formattedTime {
    final minutes = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
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
              Gap(AppSpacing.space16.h),

              // ── Top Back Button ────────────────────────────────────
              const AuthBackButton(),

              Gap(AppSpacing.space8.h),

              // ── Illustration ───────────────────────────────────────
              SizedBox(
                height: 240.h,
                child: Image.asset(
                  'assets/images/vlidate.png',
                  fit: BoxFit.contain,
                ),
              ),

              Gap(AppSpacing.space16.h),

              // ── Title ──────────────────────────────────────────────
              AppText(
                'تحقق من بريدك الالكتروني',
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
                'لقد ارسلنا رمز التحقق مكون\nمن 6 ارقام الي',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontFamily: AppTextStyles.bodyFontFamilyArabic,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(AppSpacing.space4.h),
              AppText(
                widget.email,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontFamily: AppTextStyles.bodyFontFamilyArabic,
                  color: AppColors.success,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              Gap(AppSpacing.space32.h),

              // ── 6-Digits OTP Input ─────────────────────────────────
              OtpInputField(
                length: 6,
                hasError: _hasError,
                onChanged: (code) {
                  _otpCode = code;
                  if (_hasError) setState(() => _hasError = false);
                },
                onCompleted: (code) {
                  _otpCode = code;
                  _onVerify();
                },
              ),

              Gap(AppSpacing.space12.h),

              // ── Timer or Error Message ─────────────────────────────
              if (_hasError)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      'الرمز غير صحيح حاول مره اخري',
                      style: AppTextStyles.bodySmall.copyWith(
                        fontFamily: AppTextStyles.bodyFontFamilyArabic,
                        color: AppColors.error,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(AppSpacing.space8.w),
                    Icon(
                      Icons.error_rounded,
                      color: AppColors.error,
                      size: 16.sp,
                    ),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      _formattedTime,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(AppSpacing.space8.w),
                    AppText(
                      'تنتهي صلاحية الرمز خلال',
                      style: AppTextStyles.bodySmall.copyWith(
                        fontFamily: AppTextStyles.bodyFontFamilyArabic,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),

              Gap(AppSpacing.space24.h),

              // ── Resend Code Widget ─────────────────────────────────
              ResendCodeWidget(
                onResendTap: _onResendCode,
              ),

              Gap(AppSpacing.space32.h),

              // ── Verify Button ──────────────────────────────────────
              AppButton(
                text: 'تحقق من الرمز',
                isLoading: _isLoading,
                onPressed: _onVerify,
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
    );
  }
}
