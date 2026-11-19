import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/media/app_avatar.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/teacher_groups/presentation/widgets/student_action_bar.dart';
import 'package:eureka/features/teacher_groups/presentation/widgets/student_detail_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherStudentDetailScreen extends StatelessWidget {
  const TeacherStudentDetailScreen({
    super.key,
    this.studentName = 'احمد السيد',
  });

  final String studentName;

  // Student Details data inside the widget
  static const Map<String, dynamic> _studentData = {
    'group': 'أ فيزياء',
    'subject': 'فيزياء',
    'teacherNotes': 'طالب جيد لكن يتأخر في الواجبات',
    'attendancePercent': 95,
    'absencesCount': 2,
    'examGrade': '95/100',
    'homeworkGrade': '8/10',
    'hasPaid': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'تفاصيل الطالب',
          style: AppTextStyles.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        // In RTL: leading is on the RIGHT
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
        // In RTL: actions are on the LEFT
        actions: [
          Padding(
            padding: EdgeInsets.all(AppSpacing.space8.r),
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('مراسلة الطالب أو ولي الأمر')),
                );
              },
              borderRadius: BorderRadius.circular(AppRadius.radiusFull),
              child: Container(
                width: 38.r,
                height: 38.r,
                decoration: const BoxDecoration(
                  color: Color(0xFFD7E6DD),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.chat_bubble_outline_rounded,
                  size: 18.sp,
                  color: AppColors.success,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.space20.w),
                child: Column(
                  children: [
                    Gap(AppSpacing.space16.h),
                    // Centered Avatar
                    AppAvatar(
                      radius: 46.r,
                      backgroundColor: const Color(0xFFD7E6DD),
                      child: Icon(
                        Icons.person,
                        size: 40.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Gap(AppSpacing.space12.h),
                    // Student Name
                    Text(
                      studentName,
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Gap(AppSpacing.space20.h),
                    // Teacher Notes Card (Aligned to Right in RTL)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(AppSpacing.space16.r),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7FBF8),
                        borderRadius: BorderRadius.circular(
                          AppRadius.radius16.r,
                        ),
                        border: Border.all(color: const Color(0xFFD7E6DD)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.sticky_note_2_outlined,
                                color: AppColors.success,
                                size: 20.sp,
                              ),
                              Gap(AppSpacing.space8.w),
                              Text(
                                'ملاحظات المدرس',
                                style: AppTextStyles.titleSmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                          Gap(AppSpacing.space8.h),
                          Text(
                            _studentData['teacherNotes'] as String,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 12.sp,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Gap(AppSpacing.space16.h),
                    // Student Info Card
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.space16.w,
                        vertical: AppSpacing.space8.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          AppRadius.radius16.r,
                        ),
                        border: Border.all(color: AppColors.border),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.02),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          StudentDetailInfoRow(
                            icon: Icons.groups_outlined,
                            label: 'المجموعة',
                            value: _studentData['group'] as String,
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: AppColors.border.withValues(alpha: 0.5),
                          ),
                          StudentDetailInfoRow(
                            icon: Icons.trending_up_rounded,
                            label: 'نسبة الحضور',
                            value: '${_studentData['attendancePercent']}%',
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: AppColors.border.withValues(alpha: 0.5),
                          ),
                          StudentDetailInfoRow(
                            icon: Icons.event_busy_outlined,
                            label: 'عدد الغيابات',
                            value: '${_studentData['absencesCount']}',
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: AppColors.border.withValues(alpha: 0.5),
                          ),
                          StudentDetailInfoRow(
                            icon: Icons.assignment_outlined,
                            label: 'درجة آخر امتحان',
                            value: _studentData['examGrade'] as String,
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: AppColors.border.withValues(alpha: 0.5),
                          ),
                          StudentDetailInfoRow(
                            icon: Icons.task_outlined,
                            label: 'درجة الواجبات',
                            value: _studentData['homeworkGrade'] as String,
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: AppColors.border.withValues(alpha: 0.5),
                          ),
                          StudentDetailInfoRow(
                            icon: Icons.credit_card_outlined,
                            label: 'حالة الدفع',
                            value: '',
                            valueWidget: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSpacing.space12.w,
                                vertical: AppSpacing.space4.h,
                              ),
                              decoration: BoxDecoration(
                                color: (_studentData['hasPaid'] as bool)
                                    ? const Color(0xFFE8F5E9)
                                    : const Color(0xFFFFEBEE),
                                borderRadius: BorderRadius.circular(
                                  AppRadius.radiusFull,
                                ),
                              ),
                              child: Text(
                                (_studentData['hasPaid'] as bool)
                                    ? 'تم الدفع'
                                    : 'غير مدفوع',
                                style: AppTextStyles.labelSmall.copyWith(
                                  color: (_studentData['hasPaid'] as bool)
                                      ? AppColors.success
                                      : AppColors.error,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(AppSpacing.space24.h),
                  ],
                ),
              ),
            ),
            // Bottom Action Bar
            StudentActionBar(
              onReportsTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('عرض تقارير الطالب')),
                );
              },
              onEditTap: () {
                context.push(
                  AppRoutes.teacherEditStudentScreen,
                  extra: studentName,
                );
              },
              onPaymentTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تسجيل دفعة جديدة للطالب')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
