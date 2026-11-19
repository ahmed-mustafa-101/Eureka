import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherQrCodeScreen extends StatelessWidget {
  const TeacherQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'رمز Qr Code',
          style: AppTextStyles.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        leading: const SizedBox.shrink(),
        actions: [
          IconButton(
            icon: Icon(
              Icons.close_rounded,
              color: AppColors.textPrimary,
              size: 22.sp,
            ),
            onPressed: () => context.pop(),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.space20.w),
          child: Column(
            children: [
              Gap(AppSpacing.space8.h),
              // Subtitle
              Text(
                'شارك رمز الحضور مع الطلاب للتسجيل',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 13.sp,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(AppSpacing.space20.h),
              // Meta info bar (Date | Time | Group)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.space16.w,
                  vertical: AppSpacing.space12.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLowest,
                  borderRadius: BorderRadius.circular(AppRadius.radius12.r),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _MetaItem(
                      icon: Icons.calendar_today_outlined,
                      text: '20 مايو 2024',
                    ),
                    Container(
                      height: 20.h,
                      width: 1.w,
                      color: AppColors.border,
                    ),
                    _MetaItem(
                      icon: Icons.access_time_rounded,
                      text: '10:00 AM',
                    ),
                    Container(
                      height: 20.h,
                      width: 1.w,
                      color: AppColors.border,
                    ),
                    _MetaItem(icon: Icons.groups_outlined, text: '3 ثانوي'),
                  ],
                ),
              ),
              Gap(AppSpacing.space24.h),
              // QR Card Container
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: AppSpacing.space24.h,
                  horizontal: AppSpacing.space16.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppRadius.radius20.r),
                  border: Border.all(
                    color: AppColors.success.withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.success.withValues(alpha: 0.06),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // QR Code icon / visual
                    Container(
                      padding: EdgeInsets.all(AppSpacing.space16.r),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F8F3),
                        borderRadius: BorderRadius.circular(
                          AppRadius.radius16.r,
                        ),
                      ),
                      child: Icon(
                        Icons.qr_code_2_rounded,
                        size: 160.sp,
                        color: AppColors.success,
                      ),
                    ),
                    Gap(AppSpacing.space16.h),
                    Text(
                      'اطلب من الطلاب مسح الكود',
                      style: AppTextStyles.titleSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        fontSize: 14.sp,
                      ),
                    ),
                    Gap(AppSpacing.space4.h),
                    Text(
                      'لتسجيل الحضور',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 12.sp,
                      ),
                    ),
                    Gap(AppSpacing.space12.h),
                    // Timer pill
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.space12.w,
                        vertical: AppSpacing.space4.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(
                          AppRadius.radiusFull,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 14.sp,
                            color: AppColors.success,
                          ),
                          Gap(AppSpacing.space4.w),
                          Text(
                            'الرمز صالح لمدة 15 دقيقة',
                            style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.success,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Security / Warning Note
              Container(
                padding: EdgeInsets.all(AppSpacing.space12.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FBF9),
                  borderRadius: BorderRadius.circular(AppRadius.radius12.r),
                  border: Border.all(color: const Color(0xFFD7E6DD)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'رمز QR هذا خاص بك لا تشاركه مع شخص ما يمكن لهذا الشخص مسحه صوريًا وبالتالي يمكن للطلاب الانضمام للمجموعة',
                        style: AppTextStyles.bodySmall.copyWith(
                          fontSize: 11.sp,
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Gap(AppSpacing.space8.w),
                    Icon(
                      Icons.shield_outlined,
                      color: AppColors.success,
                      size: 20.sp,
                    ),
                  ],
                ),
              ),
              Gap(AppSpacing.space20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  const _MetaItem({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: AppTextStyles.labelSmall.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 11.sp,
          ),
        ),
        Gap(AppSpacing.space4.w),
        Icon(icon, size: 14.sp, color: AppColors.textSecondary),
      ],
    );
  }
}
