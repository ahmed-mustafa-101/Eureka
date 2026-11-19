import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class TaskStepProgressIndicator extends StatelessWidget {
  const TaskStepProgressIndicator({
    super.key,
    required this.currentStep,
  });

  final int currentStep; // 1, 2, or 3

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space24.w,
        vertical: AppSpacing.space8.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _StepCircle(
            stepNumber: '1',
            title: 'البيانات',
            isActive: currentStep >= 1,
            isCompleted: currentStep > 1,
          ),
          Expanded(
            child: Container(
              height: 2.h,
              color: currentStep > 1
                  ? AppColors.success
                  : AppColors.border,
            ),
          ),
          _StepCircle(
            stepNumber: '2',
            title: 'الأسئلة',
            isActive: currentStep >= 2,
            isCompleted: currentStep > 2,
          ),
          Expanded(
            child: Container(
              height: 2.h,
              color: currentStep > 2
                  ? AppColors.success
                  : AppColors.border,
            ),
          ),
          _StepCircle(
            stepNumber: '3',
            title: 'الموعد',
            isActive: currentStep >= 3,
            isCompleted: currentStep >= 3,
          ),
        ],
      ),
    );
  }
}

class _StepCircle extends StatelessWidget {
  const _StepCircle({
    required this.stepNumber,
    required this.title,
    required this.isActive,
    required this.isCompleted,
  });

  final String stepNumber;
  final String title;
  final bool isActive;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32.r,
          height: 32.r,
          decoration: BoxDecoration(
            color: isActive ? AppColors.success : AppColors.surfaceLowest,
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? AppColors.success : AppColors.border,
              width: 1.5,
            ),
          ),
          child: Center(
            child: isCompleted
                ? Icon(
                    Icons.check_rounded,
                    color: AppColors.white,
                    size: 16.sp,
                  )
                : Text(
                    stepNumber,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: isActive ? AppColors.white : AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
          ),
        ),
        Gap(AppSpacing.space4.h),
        Text(
          title,
          style: AppTextStyles.labelSmall.copyWith(
            color: isActive ? AppColors.success : AppColors.textSecondary,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}
