import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherPublishTaskScreen extends StatelessWidget {
  const TeacherPublishTaskScreen({
    super.key,
    this.dueDate = '25 مايو 2024',
  });

  final String dueDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'نشر الواجب',
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
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.space20.w),
                child: Column(
                  children: [
                    Gap(AppSpacing.space24.h),
                    // Success Green Icon Circle
                    Container(
                      width: 68.r,
                      height: 68.r,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.success.withValues(alpha: 0.35),
                            blurRadius: 18,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.check_rounded,
                        color: AppColors.white,
                        size: 38.sp,
                      ),
                    ),
                    Gap(AppSpacing.space16.h),
                    Text(
                      'الواجب جاهز للنشر!',
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Gap(AppSpacing.space4.h),
                    Text(
                      'راجع تفاصيل الواجب قبل إتاحته لجميع الطلاب',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Gap(AppSpacing.space24.h),
                    // Summary Details Card
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.space16.w,
                        vertical: AppSpacing.space12.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.circular(AppRadius.radius16.r),
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
                          _SummaryRow(
                            label: 'الصف الدراسي',
                            value: 'الثالث الثانوي',
                            icon: Icons.school_outlined,
                          ),
                          Divider(
                            color: AppColors.border.withValues(alpha: 0.5),
                            height: 1,
                          ),
                          _SummaryRow(
                            label: 'المجموعة',
                            value: 'مجموعة أ فيزياء',
                            icon: Icons.groups_outlined,
                          ),
                          Divider(
                            color: AppColors.border.withValues(alpha: 0.5),
                            height: 1,
                          ),
                          _SummaryRow(
                            label: 'المادة',
                            value: 'فيزياء',
                            icon: Icons.menu_book_outlined,
                          ),
                          Divider(
                            color: AppColors.border.withValues(alpha: 0.5),
                            height: 1,
                          ),
                          _SummaryRow(
                            label: 'تاريخ النشر',
                            value: '20 مايو 2024',
                            icon: Icons.calendar_today_outlined,
                          ),
                          Divider(
                            color: AppColors.border.withValues(alpha: 0.5),
                            height: 1,
                          ),
                          _SummaryRow(
                            label: 'آخر موعد للتسليم',
                            value: dueDate,
                            icon: Icons.timer_outlined,
                            valueColor: AppColors.success,
                          ),
                          Divider(
                            color: AppColors.border.withValues(alpha: 0.5),
                            height: 1,
                          ),
                          _SummaryRow(
                            label: 'عدد الأسئلة',
                            value: '5 أسئلة',
                            icon: Icons.quiz_outlined,
                          ),
                        ],
                      ),
                    ),
                    Gap(AppSpacing.space20.h),
                    // Yellow Notification Alert Banner
                    Container(
                      padding: EdgeInsets.all(AppSpacing.space12.r),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFDE7),
                        borderRadius:
                            BorderRadius.circular(AppRadius.radius12.r),
                        border: Border.all(color: const Color(0xFFFFF59D)),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications_active_outlined,
                            color: const Color(0xFFF57F17),
                            size: 20.sp,
                          ),
                          Gap(AppSpacing.space8.w),
                          Expanded(
                            child: Text(
                              'سيتم إشعار جميع الطلاب المشتركين في المجموعة فور النشر فوراً',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: const Color(0xFFF57F17),
                                fontSize: 11.sp,
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
            // Bottom Button: نشر الواجب
            Padding(
              padding: EdgeInsets.all(AppSpacing.space20.r),
              child: AppButton(
                text: 'نشر الواجب',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('تم نشر الواجب بنجاح وإشعار الطلاب!'),
                      backgroundColor: AppColors.success,
                    ),
                  );
                  context.push(
                    AppRoutes.teacherTaskDetailSubmissionsScreen,
                    extra: 'واجب الفيزياء الأول',
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

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    required this.icon,
    this.valueColor,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.space12.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.space4.r),
            decoration: const BoxDecoration(
              color: Color(0xFFD7E6DD),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.success,
              size: 15.sp,
            ),
          ),
          Gap(AppSpacing.space8.w),
          Text(
            label,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              fontSize: 12.5.sp,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: valueColor ?? AppColors.textPrimary,
              fontSize: 12.5.sp,
            ),
          ),
        ],
      ),
    );
  }
}
