import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/teacher_tasks/presentation/widgets/task_category_banner_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherTasksHomeScreen extends StatefulWidget {
  const TeacherTasksHomeScreen({super.key});

  @override
  State<TeacherTasksHomeScreen> createState() => _TeacherTasksHomeScreenState();
}

class _TeacherTasksHomeScreenState extends State<TeacherTasksHomeScreen> {
  int _selectedFilterTab = 0; // 0: الكل, 1: الواجبات, 2: الامتحانات

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'المهام',
          style: AppTextStyles.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
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
              // Segment Filter Tabs
              Row(
                children: [
                  _FilterTab(
                    title: 'الكل',
                    isSelected: _selectedFilterTab == 0,
                    onTap: () => setState(() => _selectedFilterTab = 0),
                  ),
                  Gap(AppSpacing.space8.w),
                  _FilterTab(
                    title: 'الواجبات',
                    isSelected: _selectedFilterTab == 1,
                    onTap: () => setState(() => _selectedFilterTab = 1),
                  ),
                  Gap(AppSpacing.space8.w),
                  _FilterTab(
                    title: 'الامتحانات',
                    isSelected: _selectedFilterTab == 2,
                    onTap: () => setState(() => _selectedFilterTab = 2),
                  ),
                ],
              ),
              Gap(AppSpacing.space20.h),
              // Task Categories Banners
              if (_selectedFilterTab == 0 || _selectedFilterTab == 1) ...[
                TaskCategoryBannerCard(
                  title: 'الواجبات المدرسية',
                  buttonText: 'إنشاء واجب',
                  themeColor: const Color(0xFF7B1FA2),
                  backgroundColor: const Color(0xFFFBF4FD),
                  icon: Icons.assignment_outlined,
                  onTap: () => context.push(
                    AppRoutes.teacherCreateTaskBasicInfoScreen,
                    extra: 'واجب مدرسي',
                  ),
                ),
                Gap(AppSpacing.space16.h),
                TaskCategoryBannerCard(
                  title: 'الواجب المنزلي',
                  buttonText: 'إنشاء واجب',
                  themeColor: AppColors.success,
                  backgroundColor: const Color(0xFFF1F8F3),
                  icon: Icons.home_work_outlined,
                  onTap: () => context.push(
                    AppRoutes.teacherCreateTaskBasicInfoScreen,
                    extra: 'واجب منزلي',
                  ),
                ),
                Gap(AppSpacing.space16.h),
              ],
              if (_selectedFilterTab == 0 || _selectedFilterTab == 2) ...[
                TaskCategoryBannerCard(
                  title: 'الامتحانات الدورية',
                  buttonText: 'إنشاء امتحان',
                  themeColor: const Color(0xFFE65100),
                  backgroundColor: const Color(0xFFFFF8F1),
                  icon: Icons.timer_outlined,
                  onTap: () => context.push(
                    AppRoutes.teacherCreateTaskBasicInfoScreen,
                    extra: 'امتحان دوري',
                  ),
                ),
                Gap(AppSpacing.space16.h),
                TaskCategoryBannerCard(
                  title: 'الامتحانات الشهرية',
                  buttonText: 'إنشاء امتحان',
                  themeColor: const Color(0xFF1565C0),
                  backgroundColor: const Color(0xFFF1F6FD),
                  icon: Icons.menu_book_rounded,
                  onTap: () => context.push(
                    AppRoutes.teacherCreateTaskBasicInfoScreen,
                    extra: 'امتحان شهري',
                  ),
                ),
                Gap(AppSpacing.space16.h),
              ],
              // Active Tasks Summary Card (leads to submissions)
              InkWell(
                onTap: () => context.push(
                  AppRoutes.teacherTaskDetailSubmissionsScreen,
                  extra: 'واجب الفيزياء الأول',
                ),
                borderRadius: BorderRadius.circular(AppRadius.radius16.r),
                child: Container(
                  padding: EdgeInsets.all(AppSpacing.space16.r),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppRadius.radius16.r),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(AppSpacing.space8.r),
                        decoration: BoxDecoration(
                          color: AppColors.successContainer,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.bar_chart_rounded,
                          color: AppColors.success,
                        ),
                      ),
                      Gap(AppSpacing.space12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'متابعة أحدث الواجبات والتصحيح',
                              style: AppTextStyles.titleSmall.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Gap(AppSpacing.space2.h),
                            Text(
                              'عرض درجات وتسليمات الطلاب الحالية',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 14,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ),
              ),
              Gap(AppSpacing.space24.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterTab extends StatelessWidget {
  const _FilterTab({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.radius12.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.space8.h),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.success : AppColors.surfaceLowest,
            borderRadius: BorderRadius.circular(AppRadius.radius12.r),
            border: Border.all(
              color: isSelected ? AppColors.success : AppColors.border,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.labelMedium.copyWith(
                color: isSelected ? AppColors.white : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
