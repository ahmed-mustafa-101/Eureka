import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class AttachmentItemTile extends StatelessWidget {
  const AttachmentItemTile({
    super.key,
    required this.fileName,
    required this.fileSize,
    required this.fileType,
    this.onEdit,
    this.onDelete,
  });

  final String fileName;
  final String fileSize;
  final String fileType; // 'pdf', 'image', 'video'
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  Color get _iconColor {
    switch (fileType) {
      case 'pdf':
        return const Color(0xFFE53935);
      case 'image':
        return const Color(0xFF00897B);
      case 'video':
        return const Color(0xFF8E24AA);
      default:
        return AppColors.success;
    }
  }

  IconData get _iconData {
    switch (fileType) {
      case 'pdf':
        return Icons.picture_as_pdf_rounded;
      case 'image':
        return Icons.image_outlined;
      case 'video':
        return Icons.video_file_outlined;
      default:
        return Icons.insert_drive_file_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space12.w,
        vertical: AppSpacing.space8.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.radius12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          // Right side in RTL: File Icon
          Container(
            padding: EdgeInsets.all(AppSpacing.space8.r),
            decoration: BoxDecoration(
              color: _iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppRadius.radius8.r),
            ),
            child: Icon(
              _iconData,
              color: _iconColor,
              size: 20.sp,
            ),
          ),
          Gap(AppSpacing.space12.w),
          // Middle: File name & size
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: AppTextStyles.labelMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    fontSize: 12.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(AppSpacing.space2.h),
                Text(
                  fileSize,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
          // Left side in RTL: Edit and Delete action icons
          if (onEdit != null)
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                Icons.edit_outlined,
                size: 18.sp,
                color: AppColors.textSecondary,
              ),
              onPressed: onEdit,
            ),
          if (onDelete != null) ...[
            Gap(AppSpacing.space8.w),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                Icons.delete_outline_rounded,
                size: 18.sp,
                color: AppColors.error,
              ),
              onPressed: onDelete,
            ),
          ],
        ],
      ),
    );
  }
}
