import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_dropdown.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_text_field.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/teacher_tasks/presentation/widgets/task_step_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherCreateTaskBasicInfoScreen extends StatefulWidget {
  const TeacherCreateTaskBasicInfoScreen({
    super.key,
    this.taskCategory = 'واجب جديد',
  });

  final String taskCategory;

  @override
  State<TeacherCreateTaskBasicInfoScreen> createState() =>
      _TeacherCreateTaskBasicInfoScreenState();
}

class _TeacherCreateTaskBasicInfoScreenState
    extends State<TeacherCreateTaskBasicInfoScreen> {
  final TextEditingController _taskNameController =
      TextEditingController(text: 'واجب الفيزياء الأول');
  final TextEditingController _taskDescController = TextEditingController(
      text: 'حل التمارين على المعادلات الخطية وقوانين نيوتن');

  String? _selectedGrade = 'الصف الثالث الثانوي';
  String? _selectedGroup = 'مجموعة أ فيزياء';
  String? _selectedSubject = 'فيزياء';

  @override
  void dispose() {
    _taskNameController.dispose();
    _taskDescController.dispose();
    super.dispose();
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
          'إنشاء واجب جديد',
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
            const TaskStepProgressIndicator(currentStep: 1),
            Divider(color: AppColors.border.withValues(alpha: 0.6)),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.space20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Gap(AppSpacing.space16.h),
                    AppDropdown<String>(
                      label: 'اختر الصف الدراسي *',
                      hint: 'اختر الصف',
                      value: _selectedGrade,
                      items: const [
                        DropdownMenuItem(
                          value: 'الصف الأول الثانوي',
                          child: Text('الصف الأول الثانوي', textAlign: TextAlign.right),
                        ),
                        DropdownMenuItem(
                          value: 'الصف الثاني الثانوي',
                          child: Text('الصف الثاني الثانوي', textAlign: TextAlign.right),
                        ),
                        DropdownMenuItem(
                          value: 'الصف الثالث الثانوي',
                          child: Text('الصف الثالث الثانوي', textAlign: TextAlign.right),
                        ),
                      ],
                      onChanged: (v) => setState(() => _selectedGrade = v),
                    ),
                    Gap(AppSpacing.space16.h),
                    AppDropdown<String>(
                      label: 'اختر المجموعة *',
                      hint: 'اختر المجموعة',
                      value: _selectedGroup,
                      items: const [
                        DropdownMenuItem(
                          value: 'مجموعة أ فيزياء',
                          child: Text('مجموعة أ فيزياء', textAlign: TextAlign.right),
                        ),
                        DropdownMenuItem(
                          value: 'مجموعة ب فيزياء',
                          child: Text('مجموعة ب فيزياء', textAlign: TextAlign.right),
                        ),
                        DropdownMenuItem(
                          value: 'مجموعة ج كيمياء',
                          child: Text('مجموعة ج كيمياء', textAlign: TextAlign.right),
                        ),
                      ],
                      onChanged: (v) => setState(() => _selectedGroup = v),
                    ),
                    Gap(AppSpacing.space16.h),
                    AppDropdown<String>(
                      label: 'اختر المادة *',
                      hint: 'اختر المادة',
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
                          value: 'رياضيات',
                          child: Text('رياضيات', textAlign: TextAlign.right),
                        ),
                      ],
                      onChanged: (v) => setState(() => _selectedSubject = v),
                    ),
                    Gap(AppSpacing.space16.h),
                    AppTextField(
                      label: 'اسم الواجب *',
                      controller: _taskNameController,
                      hintText: 'أدخل اسم الواجب هنا',
                    ),
                    Gap(AppSpacing.space16.h),
                    AppTextField(
                      label: 'وصف الواجب *',
                      controller: _taskDescController,
                      hintText: 'أدخل تفاصيل وملاحظات الواجب للطلاب',
                      maxLines: 3,
                    ),
                    Gap(AppSpacing.space32.h),
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
                    AppRoutes.teacherSelectTaskTypeScreen,
                    extra: _taskNameController.text,
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
