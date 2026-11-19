import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/layout/app_card.dart';
import 'package:eureka/core/design_system/widgets/media/app_assets.dart';
import 'package:eureka/core/design_system/widgets/media/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({
    super.key,
    required this.title,
    required this.content,
    required this.onTap,
  });

  final String title;
  final String content;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space12.w,
        vertical: AppSpacing.space12.h,
      ),
      borderRadius: AppRadius.radius12.r,
      boxShadow: const [],
      border: Border.all(color: AppColors.border),
      child: Row(
        children: [
          Container(
            width: 3.w,
            height: 56.h,
            decoration: BoxDecoration(
              color: AppColors.success,
              borderRadius: BorderRadius.circular(AppRadius.radiusFull),
            ),
          ),
          Gap(AppSpacing.space12.w),
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: AppColors.successContainer,
              borderRadius: BorderRadius.circular(AppRadius.radius8.r),
            ),
            child: Icon(
              Icons.edit_notifications_outlined,
              color: AppColors.success,
              size: 21.sp,
            ),
          ),
          Gap(AppSpacing.space12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gap(AppSpacing.space4.h),
                Text(
                  content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Gap(AppSpacing.space8.w),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 13.sp,
            color: AppColors.textHint,
          ),
        ],
      ),
    );
  }
}

class NotificationEmptyState extends StatelessWidget {
  const NotificationEmptyState({super.key, required this.isSearchResult});

  final bool isSearchResult;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage(
              assetPath: AppAssets.notificationIllustration,
              width: 174.w,
              height: 174.h,
              semanticLabel: 'رسم توضيحي للإشعارات',
            ),
            Gap(AppSpacing.space16.h),
            Text(
              isSearchResult
                  ? 'لم يتم العثور على نتائج'
                  : 'لا توجد إشعارات حتى الآن',
              textAlign: TextAlign.center,
              style: AppTextStyles.titleSmall.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(AppSpacing.space8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.space24.w),
              child: Text(
                isSearchResult
                    ? 'جرّب استخدام كلمات مختلفة أو التأكد من صحة الإملاء.'
                    : 'عند إضافة إشعار جديد سيظهر هنا لتتمكن من إدارته.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
