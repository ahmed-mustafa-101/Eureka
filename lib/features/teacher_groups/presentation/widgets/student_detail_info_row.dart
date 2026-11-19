import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class StudentDetailInfoRow extends StatelessWidget {
  const StudentDetailInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
    this.valueWidget,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;
  final Widget? valueWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.space12.h),
      child: Row(
        children: [
          // 1. Icon on the right (RTL start)
          Container(
            padding: EdgeInsets.all(AppSpacing.space4.r),
            decoration: const BoxDecoration(
              color: Color(0xFFD7E6DD),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.success,
              size: 16.sp,
            ),
          ),
          Gap(AppSpacing.space8.w),
          // 2. Label beside the icon on the right
          Text(
            label,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              fontSize: 13.sp,
            ),
          ),
          const Spacer(),
          // 3. Value on the left (RTL end)
          if (valueWidget != null)
            valueWidget!
          else
            Text(
              value,
              style: AppTextStyles.bodyMedium.copyWith(
                color: valueColor ?? AppColors.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 13.sp,
              ),
            ),
        ],
      ),
    );
  }
}
