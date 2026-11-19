import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/text/app_text.dart';
import 'package:eureka/features/teacher_home/presentation/widgets/teacher_stat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class TeacherStatCard extends StatelessWidget {
  const TeacherStatCard({
    super.key,
    required this.stat,
    this.onTap,
  });

  final TeacherStatModel stat;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.space12.w,
          vertical: AppSpacing.space16.h,
        ),
        decoration: BoxDecoration(
          color: stat.backgroundColor,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ── Top Icon ──────────────────────────────────────────────
            Icon(
              stat.icon,
              color: stat.color,
              size: 28.sp,
            ),

            Gap(AppSpacing.space8.h),

            // ── Value ─────────────────────────────────────────────────
            AppText(
              stat.value,
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
                height: 1.1,
              ),
              textAlign: TextAlign.center,
            ),

            Gap(AppSpacing.space4.h),

            // ── Title ─────────────────────────────────────────────────
            AppText(
              stat.title,
              style: AppTextStyles.bodySmall.copyWith(
                fontFamily: AppTextStyles.bodyFontFamilyArabic,
                color: AppColors.textSecondary,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),

            Gap(AppSpacing.space8.h),

            // ── Growth / Change ───────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_upward_rounded,
                  color: stat.color,
                  size: 13.sp,
                ),
                Gap(AppSpacing.space2.w),
                Flexible(
                  child: Text(
                    stat.growth,
                    style: TextStyle(
                      fontFamily: AppTextStyles.bodyFontFamilyArabic,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: stat.color,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
