import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/features/teacher_tasks/presentation/widgets/task_student_submission_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherTaskDetailSubmissionsScreen extends StatefulWidget {
  const TeacherTaskDetailSubmissionsScreen({
    super.key,
    this.taskTitle = 'واجب الفيزياء الأول',
  });

  final String taskTitle;

  @override
  State<TeacherTaskDetailSubmissionsScreen> createState() =>
      _TeacherTaskDetailSubmissionsScreenState();
}

class _TeacherTaskDetailSubmissionsScreenState
    extends State<TeacherTaskDetailSubmissionsScreen> {
  int _selectedFilter = 0; // 0: الكل, 1: تم التسليم, 2: لم يتم التسليم

  // Mock data directly inside the widget
  static final List<Map<String, dynamic>> _studentsData = [
    {
      'name': 'سارة حسين',
      'time': 'تم التسليم منذ ساعة',
      'isSubmitted': true,
      'score': '10/10',
    },
    {
      'name': 'احمد رضا',
      'time': 'تم التسليم منذ ساعتين',
      'isSubmitted': true,
      'score': '8/10',
    },
    {
      'name': 'هند السيد',
      'time': 'تم التسليم منذ 3 ساعات',
      'isSubmitted': true,
      'score': '9/10',
    },
    {
      'name': 'محمود حسن',
      'time': 'تأخر عن موعد التسليم',
      'isSubmitted': false,
      'score': null,
    },
    {
      'name': 'يوسف خالد',
      'time': 'لم يقم بفتح الواجب بعد',
      'isSubmitted': false,
      'score': null,
    },
  ];

  List<Map<String, dynamic>> get _filteredStudents {
    if (_selectedFilter == 1) {
      return _studentsData.where((s) => s['isSubmitted'] == true).toList();
    }
    if (_selectedFilter == 2) {
      return _studentsData.where((s) => s['isSubmitted'] == false).toList();
    }
    return _studentsData;
  }

  @override
  Widget build(BuildContext context) {
    final list = _filteredStudents;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'تفاصيل الواجب',
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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.space16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(AppSpacing.space8.h),
              Center(
                child: Text(
                  widget.taskTitle,
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Gap(AppSpacing.space16.h),
              // 3 Status Stats Cards
              Row(
                children: [
                  _StatBadgeCard(
                    count: '7',
                    title: 'تم التسليم',
                    color: AppColors.success,
                    bgColor: const Color(0xFFF1F8F3),
                  ),
                  Gap(AppSpacing.space8.w),
                  _StatBadgeCard(
                    count: '3',
                    title: 'قيد الانتظار',
                    color: const Color(0xFFF57F17),
                    bgColor: const Color(0xFFFFFDE7),
                  ),
                  Gap(AppSpacing.space8.w),
                  _StatBadgeCard(
                    count: '2',
                    title: 'لم يتم التسليم',
                    color: AppColors.error,
                    bgColor: const Color(0xFFFFEBEE),
                  ),
                ],
              ),
              Gap(AppSpacing.space16.h),
              // Average Score Box
              Container(
                padding: EdgeInsets.all(AppSpacing.space16.r),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppRadius.radius16.r),
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
                    Text(
                      'متوسط درجات الطلاب في الواجب',
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Gap(AppSpacing.space8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '85',
                          style: AppTextStyles.headlineLarge.copyWith(
                            color: AppColors.success,
                            fontWeight: FontWeight.bold,
                            fontSize: 32.sp,
                          ),
                        ),
                        Text(
                          ' / 100',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Gap(AppSpacing.space8.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.space12.w,
                        vertical: AppSpacing.space4.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8E1),
                        borderRadius:
                            BorderRadius.circular(AppRadius.radiusFull),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.emoji_events_outlined,
                            size: 14.sp,
                            color: const Color(0xFFF57F17),
                          ),
                          Gap(AppSpacing.space4.w),
                          Text(
                            'مستوى تحصيل الطلاب ممتاز',
                            style: AppTextStyles.labelSmall.copyWith(
                              color: const Color(0xFFF57F17),
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(AppSpacing.space20.h),
              // Section Title & Filter Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'حالة الطلاب (${list.length})',
                    style: AppTextStyles.titleSmall.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Row(
                    children: [
                      _MiniFilterChip(
                        title: 'الكل',
                        isSelected: _selectedFilter == 0,
                        onTap: () => setState(() => _selectedFilter = 0),
                      ),
                      Gap(AppSpacing.space4.w),
                      _MiniFilterChip(
                        title: 'تم التسليم',
                        isSelected: _selectedFilter == 1,
                        onTap: () => setState(() => _selectedFilter = 1),
                      ),
                      Gap(AppSpacing.space4.w),
                      _MiniFilterChip(
                        title: 'المتأخرين',
                        isSelected: _selectedFilter == 2,
                        onTap: () => setState(() => _selectedFilter = 2),
                      ),
                    ],
                  ),
                ],
              ),
              Gap(AppSpacing.space12.h),
              // Students Submission List
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSpacing.space8.h),
                itemBuilder: (context, index) {
                  final student = list[index];
                  return TaskStudentSubmissionTile(
                    studentName: student['name'] as String,
                    submissionTime: student['time'] as String,
                    isSubmitted: student['isSubmitted'] as bool,
                    score: student['score'] as String?,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('عرض إجابة الطالب: ${student['name']}'),
                        ),
                      );
                    },
                  );
                },
              ),
              Gap(AppSpacing.space24.h),
              // Bottom Action Buttons
              AppButton(
                text: 'تسجيل الدرجات',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('تم حفظ واعتماد الدرجات بنجاح!'),
                      backgroundColor: AppColors.success,
                    ),
                  );
                },
                backgroundColor: AppColors.success,
                foregroundColor: AppColors.white,
              ),
              Gap(AppSpacing.space8.h),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.border),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.radius16.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.space12.h),
                ),
                onPressed: () => context.pop(),
                child: Text(
                  'الرجوع للمهام',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Gap(AppSpacing.space32.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatBadgeCard extends StatelessWidget {
  const _StatBadgeCard({
    required this.count,
    required this.title,
    required this.color,
    required this.bgColor,
  });

  final String count;
  final String title;
  final Color color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.space12.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppRadius.radius12.r),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          children: [
            Text(
              count,
              style: AppTextStyles.titleLarge.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            Gap(AppSpacing.space2.h),
            Text(
              title,
              style: AppTextStyles.labelSmall.copyWith(
                color: color,
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniFilterChip extends StatelessWidget {
  const _MiniFilterChip({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.radiusFull),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.space8.w,
          vertical: AppSpacing.space4.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.success : AppColors.surfaceLowest,
          borderRadius: BorderRadius.circular(AppRadius.radiusFull),
          border: Border.all(
            color: isSelected ? AppColors.success : AppColors.border,
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.labelSmall.copyWith(
            color: isSelected ? AppColors.white : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 9.sp,
          ),
        ),
      ),
    );
  }
}
