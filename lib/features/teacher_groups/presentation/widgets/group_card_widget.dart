import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class GroupCardWidget extends StatelessWidget {
  const GroupCardWidget({
    super.key,
    required this.name,
    required this.subject,
    required this.studentsCount,
    required this.lastSession,
    this.weeksCount = '10 اسبوع',
    this.isPaid = true,
    this.gradientColors = const [Color(0xFF0D47A1), Color(0xFF1976D2)],
    this.icon = Icons.science_outlined,
    required this.onTap,
  });

  final String name;
  final String subject;
  final int studentsCount;
  final String lastSession;
  final String weeksCount;
  final bool isPaid;
  final List<Color> gradientColors;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.radius16.r),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Image/Illustration banner
            Container(
              height: 85.h,
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
                    right: -10.w,
                    bottom: -10.h,
                    child: Icon(
                      icon,
                      size: 64.sp,
                      color: AppColors.white.withValues(alpha: 0.2),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(AppSpacing.space8.r),
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: AppColors.white, size: 32.sp),
                    ),
                  ),
                ],
              ),
            ),
            // Card Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.space8.w,
                  vertical: AppSpacing.space8.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title
                    Center(
                      child: Text(
                        name,
                        style: AppTextStyles.titleSmall.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Details row
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.menu_book,
                              size: 11.sp,
                              color: AppColors.textSecondary,
                            ),
                            Gap(AppSpacing.space8.w),
                            Text(
                              subject,
                              style: AppTextStyles.labelSmall.copyWith(
                                fontSize: 10.sp,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        Gap(AppSpacing.space4.h),
                        Row(
                          children: [
                            Icon(
                              Icons.people_alt_outlined,
                              size: 11.sp,
                              color: AppColors.textSecondary,
                            ),
                            Gap(AppSpacing.space8.w),
                            Text(
                              '$studentsCount طالب',
                              style: AppTextStyles.labelSmall.copyWith(
                                fontSize: 10.sp,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        Gap(AppSpacing.space4.h),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              size: 11.sp,
                              color: AppColors.textSecondary,
                            ),
                            Gap(AppSpacing.space8.w),
                            Text(
                              'اخر حصه $lastSession',
                              style: AppTextStyles.labelSmall.copyWith(
                                fontSize: 9.sp,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    // Bottom Badges
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _BadgePill(
                          text: weeksCount,
                          backgroundColor: const Color(0xFFE8F5E9),
                          textColor: AppColors.success,
                          dotColor: AppColors.success,
                        ),
                        _BadgePill(
                          text: isPaid ? 'مدفوع' : 'غير مدفوع',
                          backgroundColor: isPaid
                              ? const Color(0xFFE8F5E9)
                              : const Color(0xFFFFEBEE),
                          textColor: isPaid
                              ? AppColors.success
                              : AppColors.error,
                          dotColor: isPaid
                              ? AppColors.success
                              : AppColors.error,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BadgePill extends StatelessWidget {
  const _BadgePill({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.dotColor,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space4.w,
        vertical: AppSpacing.space2.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 4.r,
            height: 4.r,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          Gap(AppSpacing.space2.w),
          Text(
            text,
            style: AppTextStyles.labelSmall.copyWith(
              fontSize: 8.5.sp,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
