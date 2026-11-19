import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/media/app_avatar.dart';
import 'package:eureka/core/design_system/widgets/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class TeacherHomeHeader extends StatelessWidget {
  const TeacherHomeHeader({
    super.key,
    this.teacherName = 'أ / أحمد',
    this.subtitle = 'عندك 3 حصص النهارده',
    this.unreadNotificationsCount = 1,
    this.onNotificationTap,
    this.onProfileTap,
  });

  final String teacherName;
  final String subtitle;
  final int unreadNotificationsCount;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ── Right side: Teacher Info & Avatar ─────────────────────────
        GestureDetector(
          onTap: onProfileTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppAvatar(
                radius: 24.r,
                backgroundColor: const Color(0xFFD9E2EC),
                borderColor: Colors.transparent,
                child: Icon(
                  Icons.person,
                  color: AppColors.primary,
                  size: 28.sp,
                ),
              ),
              Gap(AppSpacing.space12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                    'مرحبا $teacherName',
                    style: AppTextStyles.titleMedium.copyWith(
                      fontFamily: AppTextStyles.headingFontFamilyArabic,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                  Gap(AppSpacing.space2.h),
                  AppText(
                    subtitle,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontFamily: AppTextStyles.bodyFontFamilyArabic,
                      color: AppColors.textSecondary,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // ── Left side: Notification Button with Badge ─────────────────
        GestureDetector(
          onTap: onNotificationTap,
          child: Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Icon(
                    Icons.notifications_none_rounded,
                    color: AppColors.textPrimary,
                    size: 24.sp,
                  ),
                ),
                if (unreadNotificationsCount > 0)
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      width: 18.w,
                      height: 18.w,
                      decoration: const BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '$unreadNotificationsCount',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
