import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/text/app_text.dart';
import 'package:eureka/features/teacher_home/presentation/widgets/teacher_group.dart';
import 'package:eureka/features/teacher_home/presentation/widgets/teacher_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class TeacherExamsSection extends StatelessWidget {
  const TeacherExamsSection({super.key});

  static final TeacherGroupModel _exam = TeacherGroupModel(
    title: 'مجموعة الرياضيات A',
    studentsCount: 25,
    lastSession: 'آخر حصه منذ يوم',
    leadingWidget: Icon(
      Icons.token_outlined,
      color: const Color(0xFFE91E63),
      size: 26.sp,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Section Title ─────────────────────────────────────────────
        AppText(
          'الامتحانات النشطه',
          style: AppTextStyles.titleMedium.copyWith(
            fontFamily: AppTextStyles.headingFontFamilyArabic,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),

        Gap(AppSpacing.space12.h),

        // ── Exam Card ─────────────────────────────────────────────────
        TeacherItemCard(item: _exam),
      ],
    );
  }
}
