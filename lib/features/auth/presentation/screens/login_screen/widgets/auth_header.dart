import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 90.w,
          fit: BoxFit.contain,
        ),

        Gap(AppSpacing.space24.h),

        AppText(
          title,
          style: AppTextStyles.headlineMedium.copyWith(
            fontFamily: AppTextStyles.headingFontFamilyArabic,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),

        Gap(AppSpacing.space8.h),

        AppText(
          subtitle,
          style: AppTextStyles.bodyMedium.copyWith(
            fontFamily: AppTextStyles.bodyFontFamilyArabic,
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
