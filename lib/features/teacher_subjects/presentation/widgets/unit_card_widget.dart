import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class UnitCardWidget extends StatelessWidget {
  const UnitCardWidget({
    super.key,
    required this.title,
    required this.subjectName,
    required this.chaptersCount,
    required this.videosCount,
    required this.gradientColors,
    required this.badgeColor,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subjectName;
  final int chaptersCount;
  final int videosCount;
  final List<Color> gradientColors;
  final Color badgeColor;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.radius16.r),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            // Right Side in RTL: Graphic / Formula Image banner
            Container(
              width: 95.w,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradientColors,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -6.w,
                    bottom: -6.h,
                    child: Icon(
                      icon,
                      size: 54.sp,
                      color: AppColors.white.withValues(alpha: 0.18),
                    ),
                  ),
                  Center(
                    child: Text(
                      'E = mc²',
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.white.withValues(alpha: 0.9),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(AppSpacing.space12.w),
            // Middle: Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      fontSize: 14.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(AppSpacing.space2.h),
                  Text(
                    'من مادة $subjectName',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 11.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(AppSpacing.space8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.layers_outlined,
                        size: 13.sp,
                        color: AppColors.textSecondary,
                      ),
                      Gap(AppSpacing.space2.w),
                      Text(
                        '$chaptersCount فصول',
                        style: AppTextStyles.labelSmall.copyWith(
                          fontSize: 10.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Gap(AppSpacing.space8.w),
                      Icon(
                        Icons.play_circle_outline_rounded,
                        size: 13.sp,
                        color: AppColors.textSecondary,
                      ),
                      Gap(AppSpacing.space2.w),
                      Text(
                        '$videosCount فيديوهات',
                        style: AppTextStyles.labelSmall.copyWith(
                          fontSize: 10.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Left Side in RTL: Circular badge icon
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.space12.w),
              child: Container(
                width: 36.r,
                height: 36.r,
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 18.sp,
                  color: badgeColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
