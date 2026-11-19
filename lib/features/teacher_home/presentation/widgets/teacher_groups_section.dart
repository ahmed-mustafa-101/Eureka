import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/text/app_text.dart';
import 'package:eureka/features/teacher_home/presentation/widgets/teacher_group.dart';
import 'package:eureka/features/teacher_home/presentation/widgets/teacher_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class TeacherGroupsSection extends StatelessWidget {
  const TeacherGroupsSection({super.key});

  static final List<TeacherGroupModel> _groups = [
    TeacherGroupModel(
      title: 'مجموعة أ فيزياء',
      studentsCount: 25,
      lastSession: 'آخر حصه منذ يوم',
      leadingWidget: Icon(
        Icons.bubble_chart_outlined,
        color: const Color(0xFF00ACC1),
        size: 26.sp,
      ),
    ),
    TeacherGroupModel(
      title: 'مجموعه أ كمياء',
      studentsCount: 30,
      lastSession: 'آخر حصه منذ ساعه',
      leadingWidget: Icon(
        Icons.science_outlined,
        color: const Color(0xFF1E88E5),
        size: 26.sp,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Section Title ─────────────────────────────────────────────
        AppText(
          'مجموعاتي',
          style: AppTextStyles.titleMedium.copyWith(
            fontFamily: AppTextStyles.headingFontFamilyArabic,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),

        Gap(AppSpacing.space12.h),

        // ── Group Cards ───────────────────────────────────────────────
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _groups.length,
          separatorBuilder: (context, index) => Gap(AppSpacing.space12.h),
          itemBuilder: (context, index) {
            return TeacherItemCard(item: _groups[index]);
          },
        ),
      ],
    );
  }
}
