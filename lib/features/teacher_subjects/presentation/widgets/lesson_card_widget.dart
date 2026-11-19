import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class LessonCardWidget extends StatelessWidget {
  const LessonCardWidget({
    super.key,
    required this.number,
    required this.title,
    required this.statusText,
    required this.videosCount,
    required this.examsCount,
    required this.onTap,
  });

  final String number;
  final String title;
  final String statusText;
  final int videosCount;
  final int examsCount;
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
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.space16.w,
            vertical: AppSpacing.space12.h,
          ),
          child: Row(
            children: [
              // Right side in RTL: Number badge (#01)
              Container(
                width: 38.r,
                height: 38.r,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F8F3),
                  borderRadius: BorderRadius.circular(AppRadius.radius12.r),
                ),
                child: Center(
                  child: Text(
                    number,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.success,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
              Gap(AppSpacing.space12.w),
              // Middle: Title and Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.titleSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        fontSize: 13.sp,
                      ),
                    ),
                    Gap(AppSpacing.space2.h),
                    Text(
                      statusText,
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.success,
                        fontSize: 10.sp,
                      ),
                    ),
                    Gap(AppSpacing.space4.h),
                    Row(
                      children: [
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
                        Gap(AppSpacing.space12.w),
                        Icon(
                          Icons.assignment_outlined,
                          size: 13.sp,
                          color: AppColors.textSecondary,
                        ),
                        Gap(AppSpacing.space2.w),
                        Text(
                          '$examsCount اختبار',
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
              // Left side in RTL: Book Icon in soft green container
              Container(
                padding: EdgeInsets.all(AppSpacing.space8.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F8F3),
                  borderRadius: BorderRadius.circular(AppRadius.radius8.r),
                ),
                child: Icon(
                  Icons.menu_book_rounded,
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
