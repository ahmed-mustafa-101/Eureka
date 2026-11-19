import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class SubjectCardWidget extends StatelessWidget {
  const SubjectCardWidget({
    super.key,
    required this.name,
    required this.grade,
    required this.unitsCount,
    required this.groupsCount,
    required this.filesCount,
    required this.gradientColors,
    required this.icon,
    required this.onTap,
  });

  final String name;
  final String grade;
  final int unitsCount;
  final int groupsCount;
  final int filesCount;
  final List<Color> gradientColors;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.radius16.r),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Image/Illustration banner
            Container(
              height: 90.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradientColors,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -10.w,
                    bottom: -10.h,
                    child: Icon(
                      icon,
                      size: 64.sp,
                      color: AppColors.white.withValues(alpha: 0.2),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(AppSpacing.space8.r),
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        icon,
                        color: AppColors.white,
                        size: 34.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Card Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.space12.w,
                  vertical: AppSpacing.space8.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        name,
                        style: AppTextStyles.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          fontSize: 14.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    _MetaRow(
                      icon: Icons.school_outlined,
                      text: grade,
                    ),
                    _MetaRow(
                      icon: Icons.layers_outlined,
                      text: '$unitsCount وحدات',
                    ),
                    _MetaRow(
                      icon: Icons.groups_outlined,
                      text: '$groupsCount مجموعات',
                    ),
                    _MetaRow(
                      icon: Icons.description_outlined,
                      text: '$filesCount ملف متاح',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 13.sp,
          color: AppColors.textSecondary,
        ),
        Gap(AppSpacing.space4.w),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.labelSmall.copyWith(
              fontSize: 10.sp,
              color: AppColors.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
