import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/features/teacher_home/presentation/widgets/teacher_stat.dart';
import 'package:eureka/features/teacher_home/presentation/widgets/teacher_stat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class TeacherStatsGrid extends StatelessWidget {
  const TeacherStatsGrid({super.key});

  static final List<TeacherStatModel> _stats = [
    // 0: عدد الطلاب (Top Right in RTL)
    TeacherStatModel(
      title: 'عدد الطلاب',
      value: '127',
      growth: '+12% عن الأسبوع الماضي',
      icon: Icons.people_alt_outlined,
      color: AppColors.success,
      backgroundColor: const Color(0xFFF0F7F2),
    ),
    // 1: امتحانات نشطة (Top Left in RTL)
    const TeacherStatModel(
      title: 'امتحانات نشطة',
      value: '8',
      growth: '+8% عن الأسبوع الماضي',
      icon: Icons.description_outlined,
      color: Color(0xFF2979FF),
      backgroundColor: Color(0xFFF0F5FD),
    ),
    // 2: مجموعات (Bottom Right in RTL)
    const TeacherStatModel(
      title: 'مجموعات',
      value: '5',
      growth: '+3% عن الأسبوع الماضي',
      icon: Icons.grid_view_rounded,
      color: Color(0xFF8E24AA),
      backgroundColor: Color(0xFFF7F1FB),
    ),
    // 3: نسبه التحصيل (Bottom Left in RTL)
    const TeacherStatModel(
      title: 'نسبه التحصيل',
      value: '75%',
      growth: '+6% عن الأسبوع الماضي',
      icon: Icons.account_balance_wallet_outlined,
      color: Color(0xFFF57C00),
      backgroundColor: Color(0xFFFDF6EB),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Row 1 ────────────────────────────────────────────────────
        Row(
          children: [
            Expanded(
              child: TeacherStatCard(stat: _stats[0]),
            ),
            Gap(AppSpacing.space16.w),
            Expanded(
              child: TeacherStatCard(stat: _stats[1]),
            ),
          ],
        ),

        Gap(AppSpacing.space16.h),

        // ── Row 2 ────────────────────────────────────────────────────
        Row(
          children: [
            Expanded(
              child: TeacherStatCard(stat: _stats[2]),
            ),
            Gap(AppSpacing.space16.w),
            Expanded(
              child: TeacherStatCard(stat: _stats[3]),
            ),
          ],
        ),
      ],
    );
  }
}
