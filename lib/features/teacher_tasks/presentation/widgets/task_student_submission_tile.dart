import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/media/app_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class TaskStudentSubmissionTile extends StatelessWidget {
  const TaskStudentSubmissionTile({
    super.key,
    required this.studentName,
    required this.submissionTime,
    required this.isSubmitted,
    this.score,
    required this.onTap,
  });

  final String studentName;
  final String submissionTime;
  final bool isSubmitted;
  final String? score; // e.g. "9/10"
  final VoidCallback onTap;

  String _initials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}';
    }
    return parts.isNotEmpty ? parts[0][0] : '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.radius12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.radius12.r),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.space12.w,
            vertical: AppSpacing.space8.h,
          ),
          child: Row(
            children: [
              // Right side in RTL: Avatar
              AppAvatar(
                radius: 20.r,
                backgroundColor: const Color(0xFFD7E6DD),
                child: Text(
                  _initials(studentName),
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.success,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp,
                  ),
                ),
              ),
              Gap(AppSpacing.space12.w),
              // Middle: Name & Submission status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      studentName,
                      style: AppTextStyles.titleSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        fontSize: 13.sp,
                      ),
                    ),
                    Gap(AppSpacing.space2.h),
                    Text(
                      submissionTime,
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
              // Left side in RTL: Score / Status badge
              if (isSubmitted && score != null)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.space8.w,
                    vertical: AppSpacing.space4.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(AppRadius.radiusFull),
                  ),
                  child: Text(
                    score!,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.success,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                    ),
                  ),
                )
              else
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.space8.w,
                    vertical: AppSpacing.space4.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(AppRadius.radiusFull),
                  ),
                  child: Text(
                    'لم يتم التسليم',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.error,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
