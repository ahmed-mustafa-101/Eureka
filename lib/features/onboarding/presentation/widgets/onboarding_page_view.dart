import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/features/onboarding/data/onboarding_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.model});

  final OnboardingPageModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          model.image,
          height: 0.5.sh,
          fit: BoxFit.contain,
        ),
        Gap(AppSpacing.space32),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: AppTextStyles.headlineMedium.copyWith(
            fontFamily: AppTextStyles.headingFontFamilyArabic,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(AppSpacing.space12),
        Text(
          model.subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(
            fontFamily: AppTextStyles.bodyFontFamilyArabic,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
