import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class TaskCategoryBannerCard extends StatelessWidget {
  const TaskCategoryBannerCard({
    super.key,
    required this.title,
    required this.buttonText,
    required this.themeColor,
    required this.backgroundColor,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String buttonText;
  final Color themeColor;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.space16.r),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.radius16.r),
        border: Border.all(
          color: themeColor.withValues(alpha: 0.25),
        ),
        boxShadow: [
          BoxShadow(
            color: themeColor.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Right side in RTL: Graphic / Icon Container
          Container(
            width: 75.r,
            height: 75.r,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppRadius.radius16.r),
              boxShadow: [
                BoxShadow(
                  color: themeColor.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 38.sp,
              color: themeColor,
            ),
          ),
          Gap(AppSpacing.space16.w),
          // Left side in RTL: Title & Action Button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                Gap(AppSpacing.space12.h),
                InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(AppRadius.radius12.r),
                  child: Container(
                    height: 38.h,
                    decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.circular(AppRadius.radius12.r),
                    ),
                    child: Center(
                      child: Text(
                        buttonText,
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
