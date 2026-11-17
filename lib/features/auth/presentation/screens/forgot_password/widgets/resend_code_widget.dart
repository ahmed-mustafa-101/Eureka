import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({
    super.key,
    required this.onResendTap,
  });

  final VoidCallback onResendTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space16.w,
        vertical: AppSpacing.space12.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF6FAF7),
        borderRadius: BorderRadius.circular(AppRadius.radius12),
        border: Border.all(
          color: AppColors.border.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── Text Button (Left side in RTL) ──────────────────────
          GestureDetector(
            onTap: onResendTap,
            child: AppText(
              'اعاده ارسال الرمز',
              style: AppTextStyles.labelMedium.copyWith(
                fontFamily: AppTextStyles.bodyFontFamilyArabic,
                color: AppColors.success,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // ── Question & Icon (Right side in RTL) ─────────────────
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                'لم تستلم الرمز ؟',
                style: AppTextStyles.bodySmall.copyWith(
                  fontFamily: AppTextStyles.bodyFontFamilyArabic,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(AppSpacing.space8.w),
              Icon(
                Icons.sync_rounded,
                color: AppColors.success,
                size: 20.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
