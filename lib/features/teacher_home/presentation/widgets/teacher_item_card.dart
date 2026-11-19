import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/text/app_text.dart';
import 'package:eureka/features/teacher_home/presentation/widgets/teacher_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class TeacherItemCard extends StatelessWidget {
  const TeacherItemCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final TeacherGroupModel item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSpacing.space16.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: const Color(0xFFF2F4F7),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // ── Right side: Subject Icon / Avatar ────────────────────
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFEAECF0),
                  width: 1,
                ),
              ),
              child: Center(
                child: item.leadingWidget,
              ),
            ),

            Gap(AppSpacing.space16.w),

            // ── Left side: Title & Info Details ──────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                    item.title,
                    style: TextStyle(
                      fontFamily: AppTextStyles.bodyFontFamilyArabic,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  Gap(AppSpacing.space8.h),

                  Row(
                    children: [
                      // Students count
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.people_outline_rounded,
                            size: 15.sp,
                            color: AppColors.textSecondary,
                          ),
                          Gap(AppSpacing.space4.w),
                          AppText(
                            '${item.studentsCount} طالب',
                            style: AppTextStyles.bodySmall.copyWith(
                              fontFamily: AppTextStyles.bodyFontFamilyArabic,
                              color: AppColors.textSecondary,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),

                      Gap(AppSpacing.space16.w),

                      // Last session time
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 14.sp,
                            color: AppColors.textSecondary,
                          ),
                          Gap(AppSpacing.space4.w),
                          AppText(
                            item.lastSession,
                            style: AppTextStyles.bodySmall.copyWith(
                              fontFamily: AppTextStyles.bodyFontFamilyArabic,
                              color: AppColors.textSecondary,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
