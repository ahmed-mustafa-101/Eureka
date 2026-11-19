import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class TeacherQuickActions extends StatelessWidget {
  const TeacherQuickActions({
    super.key,
    this.onAddExamTap,
    this.onAddStudentTap,
  });

  final VoidCallback? onAddExamTap;
  final VoidCallback? onAddStudentTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ── Add Exam Button (Right side in RTL) ───────────────────────
        Expanded(
          child: SizedBox(
            height: 48.h,
            child: OutlinedButton(
              onPressed: onAddExamTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.success,
                foregroundColor: AppColors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              child: Text(
                'اضافة امتحان',
                style: TextStyle(
                  fontFamily: AppTextStyles.bodyFontFamilyArabic,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),

        Gap(AppSpacing.space16.w),

        // ── Add Student Button (Left side in RTL) ──────────────────────
        Expanded(
          child: SizedBox(
            height: 48.h,
            child: OutlinedButton(
              onPressed: onAddStudentTap,
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.success,
                side: const BorderSide(color: AppColors.success, width: 1.5),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              child: Text(
                'اضافة طالب',
                style: TextStyle(
                  fontFamily: AppTextStyles.bodyFontFamilyArabic,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.success,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
