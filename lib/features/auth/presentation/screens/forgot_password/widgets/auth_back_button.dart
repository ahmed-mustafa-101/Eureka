import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: GestureDetector(
        onTap: onTap ?? () => context.pop(),
        child: Container(
          width: 44.w,
          height: 44.w,
          decoration: BoxDecoration(
            color: AppColors.success.withValues(alpha: 0.18),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_forward,
            size: 20.sp,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
