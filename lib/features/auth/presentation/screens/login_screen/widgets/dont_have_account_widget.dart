import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
    required this.onRegisterTap,
  });

  final VoidCallback onRegisterTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          'ليس لديك حساب ؟',
          style: AppTextStyles.bodyMedium.copyWith(
            fontFamily: AppTextStyles.bodyFontFamilyArabic,
            color: AppColors.textSecondary,
          ),
        ),
        Gap(AppSpacing.space4.w),
        GestureDetector(
          onTap: onRegisterTap,
          child: AppText(
            'انشاء حساب',
            style: AppTextStyles.bodyMedium.copyWith(
              fontFamily: AppTextStyles.bodyFontFamilyArabic,
              color: AppColors.success,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
