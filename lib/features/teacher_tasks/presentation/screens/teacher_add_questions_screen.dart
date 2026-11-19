import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_text_field.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/teacher_tasks/presentation/widgets/task_step_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherAddQuestionsScreen extends StatefulWidget {
  const TeacherAddQuestionsScreen({
    super.key,
    this.questionType = 'اختياري',
  });

  final String questionType;

  @override
  State<TeacherAddQuestionsScreen> createState() =>
      _TeacherAddQuestionsScreenState();
}

class _TeacherAddQuestionsScreenState extends State<TeacherAddQuestionsScreen> {
  final TextEditingController _questionTextController = TextEditingController(
    text: 'ما هي وحدة قياس القوة في النظام الدولي للوحدات؟',
  );
  final TextEditingController _scoreController =
      TextEditingController(text: '2');

  // Choices controllers for MCQ
  final List<TextEditingController> _choiceControllers = [
    TextEditingController(text: 'نيوتن'),
    TextEditingController(text: 'جول'),
    TextEditingController(text: 'باسكال'),
    TextEditingController(text: 'وات'),
  ];

  int _correctChoiceIndex = 0;

  @override
  void dispose() {
    _questionTextController.dispose();
    _scoreController.dispose();
    for (final c in _choiceControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMcq = widget.questionType == 'اختياري';

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          isMcq ? 'الواجب الاختياري' : 'الواجب المقالي',
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
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.space20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Gap(AppSpacing.space16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'السؤال رقم 1',
                          style: AppTextStyles.titleSmall.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.success,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.space8.w,
                            vertical: AppSpacing.space4.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F8F3),
                            borderRadius:
                                BorderRadius.circular(AppRadius.radiusFull),
                          ),
                          child: Text(
                            isMcq ? 'اختيار من متعدد' : 'سؤال مقالي',
                            style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.success,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(AppSpacing.space12.h),
                    AppTextField(
                      label: 'اكتب نص السؤال هنا *',
                      controller: _questionTextController,
                      hintText: 'اكتب نص السؤال بوضوح',
                      maxLines: 3,
                    ),
                    Gap(AppSpacing.space16.h),
                    if (isMcq) ...[
                      Text(
                        'الاختيارات (حدد الإجابة الصحيحة) *',
                        style: AppTextStyles.labelMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Gap(AppSpacing.space8.h),
                      ...List.generate(_choiceControllers.length, (index) {
                        final isCorrect = _correctChoiceIndex == index;
                        return Padding(
                          padding: EdgeInsets.only(bottom: AppSpacing.space8.h),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => setState(() => _correctChoiceIndex = index),
                                borderRadius: BorderRadius.circular(AppRadius.radiusFull),
                                child: Container(
                                  width: 22.r,
                                  height: 22.r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isCorrect
                                        ? AppColors.success
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: isCorrect
                                          ? AppColors.success
                                          : AppColors.border,
                                      width: 2,
                                    ),
                                  ),
                                  child: isCorrect
                                      ? Icon(
                                          Icons.check_rounded,
                                          color: AppColors.white,
                                          size: 14.sp,
                                        )
                                      : null,
                                ),
                              ),
                              Gap(AppSpacing.space8.w),
                              Expanded(
                                child: AppTextField(
                                  controller: _choiceControllers[index],
                                  hintText: 'الخيار رقم ${index + 1}',
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ] else ...[
                      AppTextField(
                        label: 'نموذج الإجابة المقترحة *',
                        hintText: 'اكتب الإجابة النموذجية التي يستند إليها التصحيح',
                        maxLines: 4,
                      ),
                    ],
                    Gap(AppSpacing.space12.h),
                    AppTextField(
                      label: 'الدرجة المحتسبة *',
                      controller: _scoreController,
                      keyboardType: TextInputType.number,
                      hintText: 'مثال: 2',
                    ),
                    Gap(AppSpacing.space16.h),
                    // Outlined button: إضافة سؤال جديد
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.success),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppRadius.radius12.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: AppSpacing.space12.h),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('تمت إضافة سؤال جديد إلى مسودة الواجب'),
                            backgroundColor: AppColors.success,
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_rounded, color: AppColors.success),
                      label: Text(
                        'إضافة سؤال جديد',
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.success,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                    AppRoutes.teacherSetTaskScheduleScreen,
                    extra: widget.questionType,
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
