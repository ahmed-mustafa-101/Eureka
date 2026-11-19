import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/media/app_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class GroupStudentTile extends StatelessWidget {
  const GroupStudentTile({
    super.key,
    required this.name,
    this.hasPaid = true,
    required this.onTap,
    this.onPhoneTap,
  });

  final String name;
  final bool hasPaid;
  final VoidCallback onTap;
  final VoidCallback? onPhoneTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.space16.w,
              vertical: AppSpacing.space12.h,
            ),

            child: Row(
              children: [
                // Student Avatar - Right
                AppAvatar(
                  radius: 22.r,
                  backgroundColor: const Color(0xFFD7E6DD),
                  child: Icon(
                    Icons.person,
                    size: 18.sp,
                    color: AppColors.textSecondary,
                  ),
                ),

                Gap(AppSpacing.space12.w),

                // Student Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.titleSmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Gap(AppSpacing.space4.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          width: 6.r,
                          height: 6.r,
                          decoration: BoxDecoration(
                            color: hasPaid
                                ? AppColors.success
                                : AppColors.error,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Gap(AppSpacing.space4.w),
                        Text(
                          hasPaid ? 'مدفوع' : 'غير مدفوع',
                          style: AppTextStyles.labelSmall.copyWith(
                            fontSize: 10.sp,
                            color: hasPaid
                                ? AppColors.success
                                : AppColors.error,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const Spacer(),

                // Phone Button - Left
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: onPhoneTap,
                  icon: Icon(
                    Icons.phone_outlined,
                    size: 18.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
