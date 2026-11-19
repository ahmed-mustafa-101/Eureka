import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/features/teacher_home/presentation/widgets/teacher_exams_section.dart';
import 'package:eureka/features/teacher_home/presentation/widgets/teacher_groups_section.dart';
import 'package:eureka/features/teacher_home/presentation/widgets/teacher_home_header.dart';
import 'package:eureka/features/teacher_home/presentation/widgets/teacher_quick_actions.dart';
import 'package:eureka/features/teacher_home/presentation/widgets/teacher_stats_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  void _onNotificationTap() {
    // TODO: Navigate to notifications
  }

  void _onAddExamTap() {
    // TODO: Open add exam flow
  }

  void _onAddStudentTap() {
    // TODO: Open add student flow
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.space20.w,
            vertical: AppSpacing.space16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Top Header ──────────────────────────────────────────
              TeacherHomeHeader(
                onNotificationTap: _onNotificationTap,
              ),

              Gap(AppSpacing.space20.h),

              // ── 2x2 Stats Cards Grid ────────────────────────────────
              const TeacherStatsGrid(),

              Gap(AppSpacing.space20.h),

              // ── Quick Actions (Add Exam / Add Student) ───────────────
              TeacherQuickActions(
                onAddExamTap: _onAddExamTap,
                onAddStudentTap: _onAddStudentTap,
              ),

              Gap(AppSpacing.space24.h),

              // ── My Groups Section ───────────────────────────────────
              const TeacherGroupsSection(),

              Gap(AppSpacing.space24.h),

              // ── Active Exams Section ────────────────────────────────
              const TeacherExamsSection(),

              Gap(AppSpacing.space16.h),
            ],
          ),
        ),
      ),
    );
  }
}
