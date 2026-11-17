import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_text_field.dart';
import 'package:eureka/core/design_system/widgets/text/app_text.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/auth/presentation/screens/forgot_password/widgets/auth_back_button.dart';
import 'package:eureka/features/auth/presentation/screens/forgot_password/widgets/password_strength_tips_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _newPasswordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  bool _isLoading = false;
  bool _currentHasError = false;
  bool _newHasError = false;
  bool _confirmHasError = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();

    _newPasswordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _onUpdatePassword() {
    final isValid = _formKey.currentState!.validate();

    setState(() {
      _currentHasError = _currentPasswordController.text.length < 6;
      _newHasError = _newPasswordController.text.length < 6;
      _confirmHasError = _confirmPasswordController.text != _newPasswordController.text;
    });

    if (!isValid) return;

    setState(() => _isLoading = true);

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم تحديث كلمة المرور بنجاح')),
        );
        context.go(AppRoutes.loginScreen);
      }
    });
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
                  height: 220.h,
                  child: Image.asset(
                    'assets/images/cuate.png',
                    fit: BoxFit.contain,
                  ),
                ),

                Gap(AppSpacing.space16.h),

                // ── Title ──────────────────────────────────────────────
                AppText(
                  'تحديث كلمه المرور',
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
                  'يرجي ادخال كلمه المرور الجديده الخاصه\nبك للحفاظ علي امان حسابك',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontFamily: AppTextStyles.bodyFontFamilyArabic,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),

                Gap(AppSpacing.space24.h),

                // ── Current Password Field ─────────────────────────────
                AppTextField(
                  controller: _currentPasswordController,
                  nextFocusNode: _newPasswordFocusNode,
                  label: 'كلمه المرور الحاليه',
                  hintText: 'ادخل كلمه المرور',
                  type: AppTextFieldType.password,
                  textInputAction: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.textSecondary,
                  ),
                  suffixIcon: _currentHasError
                      ? const Icon(
                          Icons.error_rounded,
                          color: AppColors.error,
                        )
                      : null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجي ادخال كلمه المرور الحاليه';
                    }
                    if (value.length < 6) {
                      return 'كلمه المرور غير صحيحه';
                    }
                    return null;
                  },
                ),

                Gap(AppSpacing.space16.h),

                // ── New Password Field ─────────────────────────────────
                AppTextField(
                  controller: _newPasswordController,
                  focusNode: _newPasswordFocusNode,
                  nextFocusNode: _confirmPasswordFocusNode,
                  label: 'كلمه المرور الجديده',
                  hintText: 'ادخل كلمه المرور',
                  type: AppTextFieldType.password,
                  textInputAction: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.textSecondary,
                  ),
                  suffixIcon: _newHasError
                      ? const Icon(
                          Icons.error_rounded,
                          color: AppColors.error,
                        )
                      : null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجي ادخال كلمه المرور الجديده';
                    }
                    if (value.length < 6) {
                      return 'كلمه المرور يجب ان لا تقل عن 6 احرف';
                    }
                    return null;
                  },
                ),

                Gap(AppSpacing.space16.h),

                // ── Confirm Password Field ─────────────────────────────
                AppTextField(
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocusNode,
                  label: 'تاكيد كلمه المرور',
                  hintText: 'ادخل كلمه المرور',
                  type: AppTextFieldType.password,
                  textInputAction: TextInputAction.done,
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.textSecondary,
                  ),
                  suffixIcon: _confirmHasError
                      ? const Icon(
                          Icons.error_rounded,
                          color: AppColors.error,
                        )
                      : null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجي تاكيد كلمه المرور';
                    }
                    if (value != _newPasswordController.text) {
                      return 'كلمتا المرور غير متطابقتين';
                    }
                    return null;
                  },
                ),

                Gap(AppSpacing.space20.h),

                // ── Password Strength Tips Card ────────────────────────
                const PasswordStrengthTipsCard(),

                Gap(AppSpacing.space24.h),

                // ── Submit Button ──────────────────────────────────────
                AppButton(
                  text: 'تحديث كلمه المرور',
                  isLoading: _isLoading,
                  onPressed: _onUpdatePassword,
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
