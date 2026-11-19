import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/layout/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class NotificationInfoCard extends StatelessWidget {
  const NotificationInfoCard({
    super.key,
    required this.title,
    required this.content,
    required this.date,
  });

  final String title;
  final String content;
  final String date;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(AppSpacing.space16.r),
      borderRadius: AppRadius.radius12.r,
      boxShadow: const [],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _NotificationField(label: 'عنوان الإشعار', value: title),
          Gap(AppSpacing.space16.h),
          _NotificationField(label: 'محتوى الإشعار', value: content),
          Gap(AppSpacing.space16.h),
          _NotificationField(label: 'تاريخ الإرسال', value: date),
        ],
      ),
    );
  }
}

class NotificationAudienceCard extends StatelessWidget {
  const NotificationAudienceCard({
    super.key,
    required this.grade,
    required this.group,
  });

  final String grade;
  final String group;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(AppSpacing.space16.r),
      borderRadius: AppRadius.radius12.r,
      boxShadow: const [],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الفئة المستهدفة',
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(AppSpacing.space12.h),
          _AudienceRow(icon: Icons.school_outlined, value: grade),
          Gap(AppSpacing.space8.h),
          _AudienceRow(icon: Icons.groups_outlined, value: group),
        ],
      ),
    );
  }
}

class NotificationAttachmentsCard extends StatelessWidget {
  const NotificationAttachmentsCard({super.key, required this.attachments});

  final List<String> attachments;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(AppSpacing.space16.r),
      borderRadius: AppRadius.radius12.r,
      boxShadow: const [],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'المرفقات',
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(AppSpacing.space12.h),
          ...attachments.map(
            (attachment) => Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.space8.h),
              child: _AttachmentRow(title: attachment),
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationField extends StatelessWidget {
  const _NotificationField({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.labelMedium.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        Gap(AppSpacing.space8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(AppSpacing.space12.r),
          decoration: BoxDecoration(
            color: AppColors.surfaceLowest,
            borderRadius: BorderRadius.circular(AppRadius.radius8.r),
            border: Border.all(color: AppColors.border),
          ),
          child: Text(
            value,
            textAlign: TextAlign.start,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}

class _AudienceRow extends StatelessWidget {
  const _AudienceRow({required this.icon, required this.value});

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space12.w,
        vertical: AppSpacing.space8.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceLow,
        borderRadius: BorderRadius.circular(AppRadius.radius8.r),
      ),
      child: Row(
        children: [
          Icon(icon, size: 19.sp, color: AppColors.textSecondary),
          Gap(AppSpacing.space8.w),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AttachmentRow extends StatelessWidget {
  const _AttachmentRow({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space12.w,
        vertical: AppSpacing.space8.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(AppRadius.radius8.r),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.insert_drive_file_outlined,
            size: 18,
            color: AppColors.success,
          ),
          Gap(AppSpacing.space8.w),
          Expanded(child: Text(title, style: AppTextStyles.labelSmall)),
          const Icon(
            Icons.download_outlined,
            size: 18,
            color: AppColors.success,
          ),
        ],
      ),
    );
  }
}
