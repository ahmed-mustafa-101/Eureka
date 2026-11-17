import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
    this.onRegisterSuccess,
  });

  final VoidCallback? onRegisterSuccess;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  bool _isLoading = false;
  bool _nameHasError = false;
  bool _emailHasError = false;
  bool _phoneHasError = false;
  bool _passwordHasError = false;
  bool _confirmPasswordHasError = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _onRegister() {
    final isValid = _formKey.currentState!.validate();

    setState(() {
      _nameHasError = !_isNameValid();
      _emailHasError = !_isEmailValid();
      _phoneHasError = !_isPhoneValid();
      _passwordHasError = !_isPasswordValid();
      _confirmPasswordHasError = !_isConfirmPasswordValid();
    });

    if (!isValid) return;

    setState(() => _isLoading = true);

    // TODO: dispatch register event / call BLoC
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _isLoading = false);
        widget.onRegisterSuccess?.call();
      }
    });
  }

  bool _isNameValid() {
    return _nameController.text.trim().isNotEmpty;
  }

  bool _isEmailValid() {
    final value = _emailController.text.trim();
    if (value.isEmpty) return false;
    return RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }

  bool _isPhoneValid() {
    final value = _phoneController.text.trim();
    return value.length >= 8;
  }

  bool _isPasswordValid() {
    return _passwordController.text.length >= 6;
  }

  bool _isConfirmPasswordValid() {
    return _confirmPasswordController.text.isNotEmpty &&
        _confirmPasswordController.text == _passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Name Field ─────────────────────────────────────────────
          AppTextField(
            controller: _nameController,
            label: 'الاسم',
            hintText: 'ادخل الاسم الثلاثي',
            type: AppTextFieldType.text,
            textInputAction: TextInputAction.next,
            nextFocusNode: _emailFocusNode,
            prefixIcon: const Icon(
              Icons.person_outline_rounded,
              color: AppColors.textSecondary,
            ),
            suffixIcon: _nameHasError
                ? const Icon(
                    Icons.error_rounded,
                    color: AppColors.error,
                  )
                : null,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'يرجي ادخال الاسم الثلاثي';
              }
              return null;
            },
          ),

          Gap(AppSpacing.space16.h),

          // ── Email Field ────────────────────────────────────────────
          AppTextField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            nextFocusNode: _phoneFocusNode,
            label: 'البريد الالكتروني',
            hintText: 'ادخل بريدك الالكتروني',
            type: AppTextFieldType.email,
            textInputAction: TextInputAction.next,
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
              final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value.trim())) {
                return 'يرجي ادخال بريد الكتروني صحيح';
              }
              return null;
            },
          ),

          Gap(AppSpacing.space16.h),

          // ── Phone Field ────────────────────────────────────────────
          AppTextField(
            controller: _phoneController,
            focusNode: _phoneFocusNode,
            nextFocusNode: _passwordFocusNode,
            label: 'رقم الهاتف',
            hintText: 'ادخل رقم الهاتف',
            type: AppTextFieldType.phone,
            textInputAction: TextInputAction.next,
            prefixIcon: const Icon(
              Icons.phone_outlined,
              color: AppColors.textSecondary,
            ),
            suffixIcon: _phoneHasError
                ? const Icon(
                    Icons.error_rounded,
                    color: AppColors.error,
                  )
                : null,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'يرجي ادخال رقم الهاتف';
              }
              if (value.trim().length < 8) {
                return 'رقم الهاتف غير صحيح';
              }
              return null;
            },
          ),

          Gap(AppSpacing.space16.h),

          // ── Password Field ─────────────────────────────────────────
          AppTextField(
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            nextFocusNode: _confirmPasswordFocusNode,
            label: 'كلمه المرور',
            hintText: 'ادخل كلمه المرور',
            type: AppTextFieldType.password,
            textInputAction: TextInputAction.next,
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
                return 'يرجي ادخال كلمه المرور';
              }
              if (value.length < 6) {
                return 'كلمه المرور يجب ان لا تقل عن 6 احرف';
              }
              return null;
            },
          ),

          Gap(AppSpacing.space16.h),

          // ── Confirm Password Field ─────────────────────────────────
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
            suffixIcon: _confirmPasswordHasError
                ? const Icon(
                    Icons.error_rounded,
                    color: AppColors.error,
                  )
                : null,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يرجي تاكيد كلمه المرور';
              }
              if (value != _passwordController.text) {
                return 'كلمتا المرور غير متطابقتين';
              }
              return null;
            },
          ),

          Gap(AppSpacing.space24.h),

          // ── Register Button ────────────────────────────────────────
          AppButton(
            text: 'انشاء حساب جديد',
            isLoading: _isLoading,
            onPressed: _onRegister,
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
