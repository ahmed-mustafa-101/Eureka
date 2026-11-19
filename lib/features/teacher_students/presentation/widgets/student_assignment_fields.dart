import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/layout/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class StudentGroupsPicker extends StatelessWidget {
  const StudentGroupsPicker({
    super.key,
    required this.selectedGroups,
    required this.onAddGroup,
    required this.onRemoveGroup,
    this.errorText,
  });

  final List<String> selectedGroups;
  final VoidCallback onAddGroup;
  final ValueChanged<String> onRemoveGroup;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppCard(
          padding: EdgeInsets.all(AppSpacing.space12.r),
          borderRadius: AppRadius.radius12.r,
          boxShadow: const [],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'المجموعات المختارة',
                    style: AppTextStyles.labelLarge.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.space8.w,
                      vertical: AppSpacing.space4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainer,
                      borderRadius: BorderRadius.circular(AppRadius.radiusFull),
                    ),
                    child: Text(
                      '${selectedGroups.length} مجموعات',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(AppSpacing.space12.h),
              Wrap(
                spacing: AppSpacing.space8.w,
                runSpacing: AppSpacing.space8.h,
                children: [
                  for (final group in selectedGroups)
                    _SelectedGroupChip(
                      title: group,
                      onRemove: () => onRemoveGroup(group),
                    ),
                  OutlinedButton.icon(
                    onPressed: onAddGroup,
                    icon: const Icon(Icons.add_rounded, size: 18),
                    label: const Text('إضافة مجموعة'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.success,
                      side: const BorderSide(color: AppColors.success),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.space8.w,
                        vertical: AppSpacing.space4.h,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (errorText != null) ...[
          Gap(AppSpacing.space4.h),
          Text(
            errorText!,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.error),
          ),
        ],
      ],
    );
  }
}

class _SelectedGroupChip extends StatelessWidget {
  const _SelectedGroupChip({required this.title, required this.onRemove});

  final String title;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRemove,
      borderRadius: BorderRadius.circular(AppRadius.radius8.r),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.space8.w,
          vertical: AppSpacing.space8.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.success),
          borderRadius: BorderRadius.circular(AppRadius.radius8.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.close_rounded, size: 17.sp, color: AppColors.success),
            Gap(AppSpacing.space4.w),
            Text(
              title,
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentGradePicker extends StatelessWidget {
  const StudentGradePicker({
    super.key,
    required this.grades,
    required this.selectedGrade,
    required this.onSelected,
  });

  final List<String> grades;
  final String selectedGrade;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(AppSpacing.space8.r),
      borderRadius: AppRadius.radius20.r,
      boxShadow: const [],
      child: Column(
        children: [
          for (var index = 0; index < grades.length; index++)
            _GradeOption(
              title: grades[index],
              isSelected: grades[index] == selectedGrade,
              showDivider: index < grades.length - 1,
              onTap: () => onSelected(grades[index]),
            ),
        ],
      ),
    );
  }
}

class _GradeOption extends StatelessWidget {
  const _GradeOption({
    required this.title,
    required this.isSelected,
    required this.showDivider,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final bool showDivider;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space12.w,
        vertical: AppSpacing.space12.h,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.successContainer : AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.radius8.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          if (isSelected)
            Icon(Icons.check_rounded, color: AppColors.success, size: 22.sp),
        ],
      ),
    );

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.radius8.r),
          child: content,
        ),
        if (showDivider)
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.space4.h),
            child: const Divider(height: 1, color: AppColors.border),
          ),
      ],
    );
  }
}
