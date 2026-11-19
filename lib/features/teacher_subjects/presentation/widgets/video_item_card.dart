import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class VideoItemCard extends StatelessWidget {
  const VideoItemCard({
    super.key,
    required this.title,
    required this.chapterName,
    required this.duration,
    required this.onTap,
  });

  final String title;
  final String chapterName;
  final String duration;
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
            color: AppColors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.radius16.r),
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.space8.r),
          child: Row(
            children: [
              // Right side in RTL: Video thumbnail
              Container(
                width: 75.w,
                height: 55.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF263238),
                  borderRadius: BorderRadius.circular(AppRadius.radius8.r),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF37474F), Color(0xFF212121)],
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.search_rounded,
                        color: AppColors.white.withValues(alpha: 0.4),
                        size: 24.sp,
                      ),
                    ),
                    Positioned(
                      bottom: 4.h,
                      left: 4.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 1.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.black.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          duration,
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.white,
                            fontSize: 8.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(AppSpacing.space12.w),
              // Middle: Title & Chapter
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.titleSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        fontSize: 12.5.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(AppSpacing.space4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.menu_book_outlined,
                          size: 11.sp,
                          color: AppColors.textSecondary,
                        ),
                        Gap(AppSpacing.space2.w),
                        Text(
                          chapterName,
                          style: AppTextStyles.labelSmall.copyWith(
                            fontSize: 10.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Gap(AppSpacing.space8.w),
                        Icon(
                          Icons.access_time_rounded,
                          size: 11.sp,
                          color: AppColors.textSecondary,
                        ),
                        Gap(AppSpacing.space2.w),
                        Text(
                          duration,
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
              // Left side in RTL: Green Play Button
              Container(
                width: 32.r,
                height: 32.r,
                decoration: const BoxDecoration(
                  color: Color(0xFFF1F8F3),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: AppColors.success,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
