import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_dropdown.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/teacher_tasks/presentation/widgets/task_date_picker_sheet.dart';
import 'package:eureka/features/teacher_tasks/presentation/widgets/task_step_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherSetTaskScheduleScreen extends StatefulWidget {
  const TeacherSetTaskScheduleScreen({super.key});

  @override
  State<TeacherSetTaskScheduleScreen> createState() =>
      _TeacherSetTaskScheduleScreenState();
}

class _TeacherSetTaskScheduleScreenState
    extends State<TeacherSetTaskScheduleScreen> {
  String _selectedDate = '25 مايو 2024';
  String? _selectedTime = '11:59 مساءً';
  bool _allowLateSubmission = true;

  void _openDatePicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => TaskDatePickerSheet(
        onDateSelected: (date) {
          setState(() {
            _selectedDate = date;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'تحديد موعد التسليم',
          style: AppTextStyles.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.all(AppSpacing.space8.r),
          child: InkWell(
            onTap: () => context.pop(),
            borderRadius: BorderRadius.circular(AppRadius.radiusFull),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFD7E6DD),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward_rounded,
                size: 18,
                color: AppColors.success,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const TaskStepProgressIndicator(currentStep: 3),
            Divider(color: AppColors.border.withValues(alpha: 0.6)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.space20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Gap(AppSpacing.space20.h),
                    // Date field
                    Text(
                      'تاريخ التسليم *',
                      style: AppTextStyles.labelMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Gap(AppSpacing.space8.h),
                    InkWell(
                      onTap: _openDatePicker,
                      borderRadius: BorderRadius.circular(AppRadius.radius12.r),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.space16.w,
                          vertical: AppSpacing.space14.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceLowest,
                          borderRadius: BorderRadius.circular(
                            AppRadius.radius12.r,
                          ),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: AppColors.success,
                              size: 20.sp,
                            ),
                            Gap(AppSpacing.space12.w),
                            Text(
                              _selectedDate,
                              style: AppTextStyles.bodyMedium.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_drop_down_rounded,
                              color: AppColors.textSecondary,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(AppSpacing.space20.h),
                    // Time field
                    AppDropdown<String>(
                      label: 'وقت التسليم *',
                      hint: 'اختر وقت انتهاء التسليم',
                      value: _selectedTime,
                      items: const [
                        DropdownMenuItem(
                          value: '10:00 مساءً',
                          child: Text(
                            '10:00 مساءً',
                            textAlign: TextAlign.right,
                          ),
                        ),
                        DropdownMenuItem(
                          value: '11:59 مساءً',
                          child: Text(
                            '11:59 مساءً (نهاية اليوم)',
                            textAlign: TextAlign.right,
                          ),
                        ),
                        DropdownMenuItem(
                          value: '05:00 مساءً',
                          child: Text(
                            '05:00 مساءً',
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                      onChanged: (v) => setState(() => _selectedTime = v),
                    ),
                    Gap(AppSpacing.space24.h),
                    // Allow Late Submission Toggle
                    Container(
                      padding: EdgeInsets.all(AppSpacing.space12.r),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FBF9),
                        borderRadius: BorderRadius.circular(
                          AppRadius.radius12.r,
                        ),
                        border: Border.all(color: const Color(0xFFD7E6DD)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'السماح بالتسليم المتأخر',
                                  style: AppTextStyles.labelMedium.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Gap(AppSpacing.space2.h),
                                Text(
                                  'سيتم وضع علامة "تسليم متأخر" على إجابات الطلاب بعد انتهاء الوقت',
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.textSecondary,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Switch(
                            value: _allowLateSubmission,
                            activeThumbColor: AppColors.success,
                            onChanged: (val) {
                              setState(() {
                                _allowLateSubmission = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Action
            Padding(
              padding: EdgeInsets.all(AppSpacing.space20.r),
              child: AppButton(
                text: 'التالي',
                onPressed: () {
                  context.push(
                    AppRoutes.teacherPublishTaskScreen,
                    extra: _selectedDate,
                  );
                },
                backgroundColor: AppColors.success,
                foregroundColor: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
