import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/teacher_subjects/presentation/widgets/unit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

class TeacherUnitsScreen extends StatelessWidget {
  const TeacherUnitsScreen({super.key, this.subjectName = 'الرياضيات'});

  final String subjectName;

  // Data directly inside the widget
  static final List<Map<String, dynamic>> _unitsData = [
    {
      'title': 'الجبر',
      'chaptersCount': 3,
      'videosCount': 8,
      'gradientColors': const [Color(0xFF2E7D32), Color(0xFF43A047)],
      'badgeColor': const Color(0xFF1E88E5),
      'icon': Icons.calculate_outlined,
    },
    {
      'title': 'الهندسة',
      'chaptersCount': 4,
      'videosCount': 10,
      'gradientColors': const [Color(0xFF1565C0), Color(0xFF1976D2)],
      'badgeColor': const Color(0xFF7B1FA2),
      'icon': Icons.architecture_rounded,
    },
    {
      'title': 'التفاضل والتكامل',
      'chaptersCount': 4,
      'videosCount': 12,
      'gradientColors': const [Color(0xFFD84315), Color(0xFFF4511E)],
      'badgeColor': const Color(0xFFEF6C00),
      'icon': Icons.show_chart_rounded,
    },
    {
      'title': 'الاحتمالات والإحصاء',
      'chaptersCount': 3,
      'videosCount': 7,
      'gradientColors': const [Color(0xFF00695C), Color(0xFF00897B)],
      'badgeColor': const Color(0xFF00ACC1),
      'icon': Icons.pie_chart_outline_rounded,
    },
    {
      'title': 'المثلثات',
      'chaptersCount': 2,
      'videosCount': 6,
      'gradientColors': const [Color(0xFF4527A0), Color(0xFF5E35B1)],
      'badgeColor': const Color(0xFF2E7D32),
      'icon': Icons.change_history_rounded,
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
          'الوحدات',
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
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.space16.w,
            vertical: AppSpacing.space12.h,
          ),
          itemCount: _unitsData.length,
          separatorBuilder: (context, index) =>
              SizedBox(height: AppSpacing.space12.h),
          itemBuilder: (context, index) {
            final unit = _unitsData[index];
            return UnitCardWidget(
              title: unit['title'] as String,
              subjectName: subjectName,
              chaptersCount: unit['chaptersCount'] as int,
              videosCount: unit['videosCount'] as int,
              gradientColors: unit['gradientColors'] as List<Color>,
              badgeColor: unit['badgeColor'] as Color,
              icon: unit['icon'] as IconData,
              onTap: () => context.push(
                AppRoutes.teacherUnitDetailScreen,
                extra: unit['title'] as String,
              ),
            );
          },
        ),
      ),
    );
  }
}
