import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class GroupsFilterSheet extends StatefulWidget {
  const GroupsFilterSheet({super.key});

  @override
  State<GroupsFilterSheet> createState() => _GroupsFilterSheetState();
}

class _GroupsFilterSheetState extends State<GroupsFilterSheet> {
  int _selectedGradeIndex = 0;
  String? _selectedSubject;
  String? _selectedGroup;

  final List<String> _grades = const [
    'الصف الأول الابتدائي',
    'الصف الثاني الابتدائي',
    'الصف الثالث الابتدائي',
    'الصف الرابع الابتدائي',
    'الصف الخامس الابتدائي',
    'الصف السادس الابتدائي',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
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
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close_rounded,
                  color: AppColors.textPrimary,
                  size: 22.sp,
                ),
              ),
              Text(
                'فلتره',
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(width: 40.w), // Balance close button
            ],
          ),
          Gap(AppSpacing.space16.h),
          // Scrollable filter options
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Label 1
                  Text(
                    'اختر الصف الدراسي *',
                    style: AppTextStyles.labelMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Gap(AppSpacing.space12.h),
                  // Grades List
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLowest,
                      borderRadius: BorderRadius.circular(AppRadius.radius12.r),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      children: List.generate(_grades.length, (index) {
                        final isSelected = _selectedGradeIndex == index;
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _selectedGradeIndex = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSpacing.space16.w,
                              vertical: AppSpacing.space12.h,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFF1F8F3)
                                  : Colors.transparent,
                              border: index < _grades.length - 1
                                  ? Border(
                                      bottom: BorderSide(
                                        color: AppColors.border.withValues(
                                          alpha: 0.5,
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    _grades[index],
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: isSelected
                                          ? AppColors.success
                                          : AppColors.textSecondary,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),

                                Gap(AppSpacing.space12.w),

                                if (isSelected)
                                  Icon(
                                    Icons.check_rounded,
                                    color: AppColors.success,
                                    size: 18.sp,
                                  )
                                else
                                  SizedBox(width: 18.sp),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Gap(AppSpacing.space20.h),
                  // Select Subject
                  AppDropdown<String>(
                    label: 'اختر الماده *',
                    hint: 'اختر الصف',
                    value: _selectedSubject,
                    items: const [
                      DropdownMenuItem(
                        value: 'فيزياء',
                        child: Text('فيزياء', textAlign: TextAlign.right),
                      ),
                      DropdownMenuItem(
                        value: 'كيمياء',
                        child: Text('كيمياء', textAlign: TextAlign.right),
                      ),
                      DropdownMenuItem(
                        value: 'أحياء',
                        child: Text('أحياء', textAlign: TextAlign.right),
                      ),
                    ],
                    onChanged: (v) => setState(() => _selectedSubject = v),
                  ),
                  Gap(AppSpacing.space16.h),
                  // Select Group
                  AppDropdown<String>(
                    label: 'اختر المجموعه *',
                    hint: 'اختر الصف',
                    value: _selectedGroup,
                    items: const [
                      DropdownMenuItem(
                        value: 'مجموعه أ',
                        child: Text('مجموعه أ', textAlign: TextAlign.right),
                      ),
                      DropdownMenuItem(
                        value: 'مجموعه ب',
                        child: Text('مجموعه ب', textAlign: TextAlign.right),
                      ),
                      DropdownMenuItem(
                        value: 'مجموعه ج',
                        child: Text('مجموعه ج', textAlign: TextAlign.right),
                      ),
                    ],
                    onChanged: (v) => setState(() => _selectedGroup = v),
                  ),
                  Gap(AppSpacing.space24.h),
                ],
              ),
            ),
          ),
          // Continue Button
          AppButton(
            text: 'متابعه',
            onPressed: () => Navigator.of(context).pop(),
            backgroundColor: AppColors.success,
            foregroundColor: AppColors.white,
          ),
          Gap(AppSpacing.space8.h),
        ],
      ),
    );
  }
}
