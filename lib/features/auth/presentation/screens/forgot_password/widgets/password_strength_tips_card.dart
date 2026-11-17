import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class PasswordStrengthTipsCard extends StatelessWidget {
  const PasswordStrengthTipsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space16.w,
        vertical: AppSpacing.space16.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F9F6),
        borderRadius: BorderRadius.circular(AppRadius.radius12),
        border: Border.all(
          color: AppColors.success.withValues(alpha: 0.15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Title with Icon ─────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                'نصائح لانشاء كلمه مرور قويه',
                style: AppTextStyles.labelMedium.copyWith(
                  fontFamily: AppTextStyles.bodyFontFamilyArabic,
                  color: AppColors.success,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.assignment_outlined,
                color: AppColors.success,
                size: 20.sp,
              ),
            ],
          ),

          Gap(AppSpacing.space12.h),

          // ── Checklist items ─────────────────────────────────────
          _buildTipItem('8 أحرف على الأقل'),
          Gap(AppSpacing.space8.h),
          _buildTipItem('يحتوي على رقم'),
          Gap(AppSpacing.space8.h),
          _buildTipItem('يحتوي على رمز خاص'),
        ],
      ),
    );
  }

  Widget _buildTipItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppText(
          text,
          style: AppTextStyles.bodySmall.copyWith(
            fontFamily: AppTextStyles.bodyFontFamilyArabic,
            color: AppColors.textSecondary,
            fontSize: 12.sp,
          ),
        ),
        Gap(AppSpacing.space8.w),
        Icon(
          Icons.check_circle_outline_rounded,
          color: AppColors.success,
          size: 16.sp,
        ),
      ],
    );
  }
}
