import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_text_field.dart';
import 'package:eureka/features/auth/presentation/screens/login_screen/widgets/forgot_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    this.onLoginSuccess,
    this.onForgotPassword,
  });

  final VoidCallback? onLoginSuccess;
  final VoidCallback? onForgotPassword;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();

  bool _isLoading = false;
  bool _emailHasError = false;
  bool _passwordHasError = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _onLogin() {
    final isValid = _formKey.currentState!.validate();

    setState(() {
      _emailHasError = !_isEmailValid();
      _passwordHasError = !_isPasswordValid();
    });

    if (!isValid) return;

    setState(() => _isLoading = true);

    // TODO: dispatch login event / call BLoC
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _isLoading = false);
        widget.onLoginSuccess?.call();
      }
    });
  }

  bool _isEmailValid() {
    final value = _emailController.text.trim();
    if (value.isEmpty) return false;
    return RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }

  bool _isPasswordValid() {
    return _passwordController.text.length >= 6;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Email Field ──────────────────────────────────────────
          AppTextField(
            controller: _emailController,
            label: 'البريد الالكتروني',
            hintText: 'example@gmail.com',
            type: AppTextFieldType.email,
            textInputAction: TextInputAction.next,
            nextFocusNode: _passwordFocusNode,
            prefixIcon: const Icon(
              Icons.email_outlined,
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
              final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value.trim())) {
                return 'يرجي ادخال بريد الكتروني صحيح';
              }
              return null;
            },
          ),

          Gap(AppSpacing.space16.h),

          AppTextField(
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            label: 'كلمه المرور',
            hintText: '••••••••',
            type: AppTextFieldType.password,
            textInputAction: TextInputAction.done,
            prefixIcon: const Icon(
              Icons.lock_outline_rounded,
              color: AppColors.textSecondary,
            ),
            suffixIcon: _passwordHasError
                ? const Icon(
                    Icons.error_rounded,
                    color: AppColors.error,
                  )
                : null,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'كلمه المرور غير صحيحه';
              }
              if (value.length < 6) {
                return 'كلمه المرور غير صحيحه';
              }
              return null;
            },
          ),

          Gap(AppSpacing.space12.h),

          ForgotPasswordWidget(
            onTap: widget.onForgotPassword ?? () {},
          ),

          Gap(AppSpacing.space32.h),

          AppButton(
            text: 'تسجيل الدخول',
            isLoading: _isLoading,
            onPressed: _onLogin,
            backgroundColor: AppColors.success,
            foregroundColor: AppColors.white,
            textStyle: AppTextStyles.titleMedium.copyWith(
              fontFamily: AppTextStyles.bodyFontFamilyArabic,
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
