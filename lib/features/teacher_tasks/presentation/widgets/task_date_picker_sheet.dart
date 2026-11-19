import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class TaskDatePickerSheet extends StatefulWidget {
  const TaskDatePickerSheet({
    super.key,
    required this.onDateSelected,
  });

  final ValueChanged<String> onDateSelected;

  @override
  State<TaskDatePickerSheet> createState() => _TaskDatePickerSheetState();
}

class _TaskDatePickerSheetState extends State<TaskDatePickerSheet> {
  int _selectedDay = 25;

  final List<String> _weekDays = const ['ح', 'ن', 'ث', 'ر', 'خ', 'ج', 'س'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space20.w,
        vertical: AppSpacing.space16.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.radius24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header: Close and Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 32.w),
              Text(
                'اختر تاريخ',
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close_rounded,
                  color: AppColors.textPrimary,
                  size: 22.sp,
                ),
              ),
            ],
          ),
          Gap(AppSpacing.space12.h),
          // Month Switcher Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left_rounded, color: AppColors.success),
                onPressed: () {},
              ),
              Text(
                'مايو 2024',
                style: AppTextStyles.titleSmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right_rounded, color: AppColors.success),
                onPressed: () {},
              ),
            ],
          ),
          Gap(AppSpacing.space12.h),
          // Weekdays header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _weekDays
                .map(
                  (d) => Text(
                    d,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
                .toList(),
          ),
          Gap(AppSpacing.space8.h),
          // Calendar Days Grid (5 weeks of May)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.1,
            ),
            itemCount: 31,
            itemBuilder: (context, index) {
              final day = index + 1;
              final isSelected = day == _selectedDay;
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedDay = day;
                  });
                },
                borderRadius: BorderRadius.circular(AppRadius.radiusFull),
                child: Center(
                  child: Container(
                    width: 32.r,
                    height: 32.r,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.success : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$day',
                        style: AppTextStyles.labelMedium.copyWith(
                          color: isSelected ? AppColors.white : AppColors.textPrimary,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Gap(AppSpacing.space20.h),
          // Confirm Button
          AppButton(
            text: 'تأكيد',
            onPressed: () {
              widget.onDateSelected('$_selectedDay مايو 2024');
              Navigator.of(context).pop();
            },
            backgroundColor: AppColors.success,
            foregroundColor: AppColors.white,
          ),
          Gap(AppSpacing.space8.h),
        ],
      ),
    );
  }
}
