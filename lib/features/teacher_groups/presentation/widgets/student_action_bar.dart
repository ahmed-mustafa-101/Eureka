import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class StudentActionBar extends StatelessWidget {
  const StudentActionBar({
    super.key,
    this.onReportsTap,
    this.onEditTap,
    this.onPaymentTap,
  });

  final VoidCallback? onReportsTap;
  final VoidCallback? onEditTap;
  final VoidCallback? onPaymentTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppSpacing.space16.r),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space12.w,
        vertical: AppSpacing.space12.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.success,
        borderRadius: BorderRadius.circular(AppRadius.radius16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.success.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 1. Appears on the Right in RTL: تقارير
          _ActionBarItem(
            icon: Icons.insert_chart_outlined_rounded,
            title: 'تقارير',
            onTap: onReportsTap,
          ),
          Container(
            height: 24.h,
            width: 1.w,
            color: AppColors.white.withValues(alpha: 0.3),
          ),
          // 2. In the Middle: تعديل بيانات
          _ActionBarItem(
            icon: Icons.edit_note_rounded,
            title: 'تعديل بيانات',
            onTap: onEditTap,
          ),
          Container(
            height: 24.h,
            width: 1.w,
            color: AppColors.white.withValues(alpha: 0.3),
          ),
          // 3. Appears on the Left in RTL: تسجيل دفعة
          _ActionBarItem(
            icon: Icons.payments_outlined,
            title: 'تسجيل دفعة',
            onTap: onPaymentTap,
          ),
        ],
      ),
    );
  }
}

class _ActionBarItem extends StatelessWidget {
  const _ActionBarItem({
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.radius8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.space8.w,
          vertical: AppSpacing.space4.h,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: AppColors.white,
              size: 18.sp,
            ),
            Gap(AppSpacing.space4.w),
            Text(
              title,
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
