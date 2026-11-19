import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/widgets/app_bar/app_app_bar.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/teacher_notifications/presentation/widgets/notification_detail_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherNotificationDetailsScreen extends StatefulWidget {
  const TeacherNotificationDetailsScreen({
    super.key,
    required this.notification,
  });

  final Map<String, dynamic> notification;

  @override
  State<TeacherNotificationDetailsScreen> createState() =>
      _TeacherNotificationDetailsScreenState();
}

class _TeacherNotificationDetailsScreenState
    extends State<TeacherNotificationDetailsScreen> {
  late Map<String, dynamic> _notification;

  @override
  void initState() {
    super.initState();
    _notification = Map<String, dynamic>.from(widget.notification);
  }

  Future<void> _editNotification() async {
    final updated = await context.push<Map<String, dynamic>>(
      AppRoutes.teacherNotificationFormScreen,
      extra: _notification,
    );
    if (updated != null && mounted) {
      setState(() => _notification = updated);
    }
  }

  Future<void> _deleteNotification() async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('حذف الإشعار', textAlign: TextAlign.right),
        content: const Text(
          'هل أنت متأكد من حذف هذا الإشعار؟',
          textAlign: TextAlign.right,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text('حذف', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );

    if (shouldDelete == true && mounted) {
      context.pop(<String, dynamic>{'_deleted': true});
    }
  }

  @override
  Widget build(BuildContext context) {
    final attachments =
        (_notification['attachments'] as List<String>?) ?? const <String>[];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppAppBar(
        title: const Text('تفاصيل الإشعار'),
        centerTitle: true,
        backgroundColor: AppColors.white,
        leading: IconButton(
          tooltip: 'رجوع',
          onPressed: () => context.pop(_notification),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        actions: [
          IconButton(
            tooltip: 'تعديل الإشعار',
            onPressed: _editNotification,
            icon: const Icon(Icons.edit_outlined, color: AppColors.textPrimary),
          ),
          IconButton(
            tooltip: 'حذف الإشعار',
            onPressed: _deleteNotification,
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: AppColors.error,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.space16.w,
                  vertical: AppSpacing.space12.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    NotificationInfoCard(
                      title: _notification['title'] as String,
                      content: _notification['content'] as String,
                      date: _notification['date'] as String,
                    ),
                    Gap(AppSpacing.space16.h),
                    NotificationAudienceCard(
                      grade: _notification['grade'] as String,
                      group: _notification['group'] as String,
                    ),
                    if (attachments.isNotEmpty) ...[
                      Gap(AppSpacing.space16.h),
                      NotificationAttachmentsCard(attachments: attachments),
                    ],
                    Gap(AppSpacing.space8.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppSpacing.space16.r),
              child: AppButton(
                text: 'انتقل إلى الدرس',
                leading: Icon(
                  Icons.open_in_new_rounded,
                  size: 19.sp,
                  color: AppColors.white,
                ),
                backgroundColor: AppColors.success,
                foregroundColor: AppColors.white,
                onPressed: () => context.push(
                  AppRoutes.teacherLessonDetailScreen,
                  extra: _notification['title'],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
