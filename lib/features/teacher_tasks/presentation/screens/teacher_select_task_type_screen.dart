import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/teacher_tasks/presentation/widgets/task_step_progress_indicator.dart';
import 'package:eureka/features/teacher_tasks/presentation/widgets/task_type_select_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherSelectTaskTypeScreen extends StatefulWidget {
  const TeacherSelectTaskTypeScreen({
    super.key,
    this.taskName = 'واجب جديد',
  });

  final String taskName;

  @override
  State<TeacherSelectTaskTypeScreen> createState() =>
      _TeacherSelectTaskTypeScreenState();
}

class _TeacherSelectTaskTypeScreenState
    extends State<TeacherSelectTaskTypeScreen> {
  int _selectedType = 0; // 0: اختياري (MCQ), 1: مقالي (Essay)

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
            const TaskStepProgressIndicator(currentStep: 2),
            Divider(color: AppColors.border.withValues(alpha: 0.6)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.space20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Gap(AppSpacing.space20.h),
                    Text(
                      'اختر نوع الأسئلة المناسب للواجب',
                      style: AppTextStyles.titleSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Gap(AppSpacing.space4.h),
                    Text(
                      'يمكنك اختيار نمط الأسئلة الاختيارية أو الأسئلة المقالية المطولة',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 11.sp,
                      ),
                    ),
                    Gap(AppSpacing.space24.h),
                    TaskTypeSelectCard(
                      title: 'الواجب الاختياري',
                      description: 'إنشاء أسئلة اختيار من متعدد مع خيارات متعددة وتحديد الإجابة الصحيحة تلقائياً',
                      icon: Icons.checklist_rounded,
                      isSelected: _selectedType == 0,
                      onTap: () => setState(() => _selectedType = 0),
                    ),
                    Gap(AppSpacing.space16.h),
                    TaskTypeSelectCard(
                      title: 'الواجب المقالي',
                      description: 'إنشاء أسئلة مقالية تتطلب إجابات كتابية وشرح من الطلاب مع نموذج إجابة استرشادي',
                      icon: Icons.edit_note_rounded,
                      isSelected: _selectedType == 1,
                      onTap: () => setState(() => _selectedType = 1),
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
                    AppRoutes.teacherAddQuestionsScreen,
                    extra: _selectedType == 0 ? 'اختياري' : 'مقالي',
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
