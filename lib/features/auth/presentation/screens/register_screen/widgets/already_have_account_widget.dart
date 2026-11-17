import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({
    super.key,
    required this.onLoginTap,
  });

  final VoidCallback onLoginTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          'لديك حساب بالفعل؟',
          style: AppTextStyles.bodyMedium.copyWith(
            fontFamily: AppTextStyles.bodyFontFamilyArabic,
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(AppSpacing.space4.h),
        GestureDetector(
          onTap: onLoginTap,
          child: AppText(
            'تسجيل الدخول',
            style: AppTextStyles.bodyMedium.copyWith(
              fontFamily: AppTextStyles.bodyFontFamilyArabic,
              color: AppColors.success,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
