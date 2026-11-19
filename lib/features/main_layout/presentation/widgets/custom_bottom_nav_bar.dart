import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.space16.w,
        vertical: AppSpacing.space12.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space8.w,
        vertical: AppSpacing.space8.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: const Color(0xFFF2F4F7),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            index: 0,
            icon: Icons.home_outlined,
            activeIcon: Icons.home_rounded,
            label: 'الرئيسيه',
          ),
          _buildNavItem(
            index: 1,
            icon: Icons.groups_outlined,
            activeIcon: Icons.groups_rounded,
            label: 'المجموعات',
          ),
          _buildNavItem(
            index: 2,
            icon: Icons.menu_book_outlined,
            activeIcon: Icons.menu_book_rounded,
            label: 'المواد',
          ),
          _buildNavItem(
            index: 3,
            icon: Icons.assignment_outlined,
            activeIcon: Icons.assignment_rounded,
            label: 'المهام',
          ),
          _buildNavItem(
            index: 4,
            icon: Icons.account_balance_wallet_outlined,
            activeIcon: Icons.account_balance_wallet_rounded,
            label: 'الماليه',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final isSelected = currentIndex == index;

    if (isSelected) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.space12.w,
          vertical: AppSpacing.space4.h,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFEAF5EF),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              activeIcon,
              color: AppColors.success,
              size: 22.sp,
            ),
            Gap(AppSpacing.space2.h),
            Text(
              label,
              style: TextStyle(
                fontFamily: AppTextStyles.bodyFontFamilyArabic,
                fontSize: 10.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.success,
              ),
            ),
            Gap(AppSpacing.space2.h),
            Container(
              width: 4.w,
              height: 4.w,
              decoration: const BoxDecoration(
                color: AppColors.success,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(index),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.space8.w,
          vertical: AppSpacing.space4.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: AppColors.black,
              size: 22.sp,
            ),
            Gap(AppSpacing.space4.h),
            Text(
              label,
              style: TextStyle(
                fontFamily: AppTextStyles.bodyFontFamilyArabic,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            Gap(AppSpacing.space4.h),
          ],
        ),
      ),
    );
  }
}
