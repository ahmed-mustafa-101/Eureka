import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/teacher_subjects/presentation/widgets/lesson_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherUnitDetailScreen extends StatelessWidget {
  const TeacherUnitDetailScreen({super.key, this.unitName = 'الجبر'});

  final String unitName;

  // Data directly inside the widget
  static final List<Map<String, dynamic>> _lessonsData = [
    {
      'number': '#01',
      'title': 'المعادلات الخطية',
      'statusText': 'حصة تلي',
      'videosCount': 3,
      'examsCount': 1,
    },
    {
      'number': '#02',
      'title': 'الأعداد الصحيحة',
      'statusText': 'حصة تلي',
      'videosCount': 2,
      'examsCount': 1,
    },
    {
      'number': '#03',
      'title': 'الكسور والنسب',
      'statusText': 'حصة تلي',
      'videosCount': 3,
      'examsCount': 1,
    },
    {
      'number': '#04',
      'title': 'المتباينات',
      'statusText': 'حصة تلي',
      'videosCount': 2,
      'examsCount': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'تفاصيل الوحده',
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
                Icons.arrow_back,
                size: 18,
                color: AppColors.success,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.space16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(AppSpacing.space12.h),
              // Hero Green Banner
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(AppSpacing.space20.r),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2E7D4E), Color(0xFF388E3C)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(AppRadius.radius20.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2E7D4E).withValues(alpha: 0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Graphic/Illustration on Right in RTL
                    Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(
                          AppRadius.radius16.r,
                        ),
                      ),
                      child: Icon(
                        Icons.calculate_rounded,
                        size: 48.sp,
                        color: AppColors.white,
                      ),
                    ),
                    Gap(AppSpacing.space16.w),
                    // Details in Middle
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            unitName,
                            style: AppTextStyles.headlineLarge.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp,
                            ),
                          ),
                          Gap(AppSpacing.space4.h),
                          Text(
                            'من مادة الرياضيات',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.white.withValues(alpha: 0.85),
                              fontSize: 12.sp,
                            ),
                          ),
                          Gap(AppSpacing.space8.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSpacing.space8.w,
                              vertical: AppSpacing.space2.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(
                                AppRadius.radiusFull,
                              ),
                            ),
                            child: Text(
                              '3 دروس',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(AppSpacing.space24.h),
              // Section Title: الدروس
              Text(
                'الدروس',
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Gap(AppSpacing.space12.h),
              // Lessons List
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _lessonsData.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSpacing.space12.h),
                itemBuilder: (context, index) {
                  final lesson = _lessonsData[index];
                  return LessonCardWidget(
                    number: lesson['number'] as String,
                    title: lesson['title'] as String,
                    statusText: lesson['statusText'] as String,
                    videosCount: lesson['videosCount'] as int,
                    examsCount: lesson['examsCount'] as int,
                    onTap: () => context.push(
                      AppRoutes.teacherLessonDetailScreen,
                      extra: lesson['title'] as String,
                    ),
                  );
                },
              ),
              Gap(AppSpacing.space24.h),
            ],
          ),
        ),
      ),
    );
  }
}
