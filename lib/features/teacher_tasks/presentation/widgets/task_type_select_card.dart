import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class TaskTypeSelectCard extends StatelessWidget {
  const TaskTypeSelectCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String description;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.radius16.r),
      child: Container(
        padding: EdgeInsets.all(AppSpacing.space16.r),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF1F8F3) : AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.radius16.r),
          border: Border.all(
            color: isSelected ? AppColors.success : AppColors.border,
            width: isSelected ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? AppColors.success.withValues(alpha: 0.08)
                  : AppColors.black.withValues(alpha: 0.02),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Right side in RTL: Graphic Box
            Container(
              width: 50.r,
              height: 50.r,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.success.withValues(alpha: 0.15)
                    : const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(AppRadius.radius12.r),
              ),
              child: Icon(
                icon,
                color: isSelected ? AppColors.success : AppColors.textSecondary,
                size: 26.sp,
              ),
            ),
            Gap(AppSpacing.space16.w),
            // Middle: Title & Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? AppColors.success
                          : AppColors.textPrimary,
                      fontSize: 14.sp,
                    ),
                  ),
                  Gap(AppSpacing.space4.h),
                  Text(
                    description,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
            // Left side in RTL: Radio Check Circle
            Container(
              width: 22.r,
              height: 22.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.success : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColors.success : AppColors.border,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check_rounded,
                      color: AppColors.white,
                      size: 14.sp,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
