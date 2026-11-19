import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class AppImageUploadArea extends StatelessWidget {
  const AppImageUploadArea({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedRoundedBorderPainter(
        color: AppColors.success.withValues(alpha: 0.55),
        radius: AppRadius.radius20.r,
      ),
      child: SizedBox(
        height: 156.h,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_camera_rounded,
              size: 60.sp,
              color: AppColors.success,
            ),
            Gap(AppSpacing.space12.h),
            Text(
              title,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Gap(AppSpacing.space4.h),
            Text(
              'JPG, PNG (الحد الأقصى 5MB)',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashedRoundedBorderPainter extends CustomPainter {
  const _DashedRoundedBorderPainter({
    required this.color,
    required this.radius,
  });

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    const dashLength = 6.0;
    const dashGap = 5.0;
    final borderPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(radius)),
      );
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (final metric in borderPath.computeMetrics()) {
      for (
        var start = 0.0;
        start < metric.length;
        start += dashLength + dashGap
      ) {
        final end = (start + dashLength).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(start, end), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DashedRoundedBorderPainter oldDelegate) =>
      color != oldDelegate.color || radius != oldDelegate.radius;
}
