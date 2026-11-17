import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class OnboardingDotIndicator extends StatelessWidget {
  const OnboardingDotIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  final int count;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: isActive ? 24.w : 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.success
                    : AppColors.textSecondary.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            if (index < count - 1) Gap(4.w),
          ],
        );
      }),
    );
  }
}
