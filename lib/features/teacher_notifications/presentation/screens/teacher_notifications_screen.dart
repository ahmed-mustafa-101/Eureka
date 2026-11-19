import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/widgets/app_bar/app_app_bar.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_search_field.dart';
import 'package:eureka/features/teacher_notifications/presentation/widgets/notification_list_widgets.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherNotificationsScreen extends StatefulWidget {
  const TeacherNotificationsScreen({super.key});

  @override
  State<TeacherNotificationsScreen> createState() =>
      _TeacherNotificationsScreenState();
}

class _TeacherNotificationsScreenState
    extends State<TeacherNotificationsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'درس فيزياء جديد تم رفعه',
      'content': 'تم رفع شرح قوانين نيوتن على المنصة، يمكنكم مشاهدة الدرس ومراجعة الأمثلة قبل الحصة القادمة.',
      'grade': 'الصف الأول الثانوي',
      'group': 'مجموعة أ فيزياء',
      'date': '22 يوليو 2026',
      'attachments': <String>[
        'قوانين نيوتن',
        'شرح الدرس فيديو',
        'ملخص قوانين نيوتن',
      ],
    },
    {
      'title': 'تم رفع نموذج اختبار الرياضيات',
      'content': 'نموذج الاختبار متاح الآن للمراجعة قبل موعد الاختبار.',
      'grade': 'الصف الثاني الثانوي',
      'group': 'مجموعة ب رياضيات',
      'date': '20 يوليو 2026',
      'attachments': <String>['نموذج الاختبار'],
    },
    {
      'title': 'تذكير بموعد الحصة القادمة',
      'content': 'نلتقي غدًا لمتابعة شرح الوحدة الجديدة.',
      'grade': 'الصف الأول الثانوي',
      'group': 'مجموعة أ فيزياء',
      'date': '18 يوليو 2026',
      'attachments': <String>[],
    },
    {
      'title': 'تم رفع ملخص الكيمياء',
      'content': 'يمكنكم الآن تنزيل الملخص ومراجعته قبل الحصة.',
      'grade': 'الصف الثالث الثانوي',
      'group': 'مجموعة ج كيمياء',
      'date': '15 يوليو 2026',
      'attachments': <String>['ملخص الكيمياء'],
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredNotifications {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) return _notifications;

    return _notifications.where((notification) {
      return (notification['title'] as String).toLowerCase().contains(query) ||
          (notification['content'] as String).toLowerCase().contains(query) ||
          (notification['grade'] as String).toLowerCase().contains(query) ||
          (notification['group'] as String).toLowerCase().contains(query);
    }).toList();
  }

  Future<void> _addNotification() async {
    final notification = await context.push<Map<String, dynamic>>(
      AppRoutes.teacherNotificationFormScreen,
    );
    if (notification != null && mounted) {
      setState(() => _notifications.insert(0, notification));
    }
  }

  Future<void> _openNotification(Map<String, dynamic> notification) async {
    final result = await context.push<Map<String, dynamic>>(
      AppRoutes.teacherNotificationDetailsScreen,
      extra: notification,
    );
    if (result == null || !mounted) return;

    setState(() {
      if (result['_deleted'] == true) {
        _notifications.remove(notification);
      } else {
        final index = _notifications.indexOf(notification);
        if (index >= 0) _notifications[index] = result;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifications = _filteredNotifications;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppAppBar(
        title: Text('الإشعارات'),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.space16.w,
            AppSpacing.space8.h,
            AppSpacing.space16.w,
            AppSpacing.space16.h,
          ),
          child: Column(
            children: [
              AppSearchField(
                controller: _searchController,
                hintText: 'ابحث عن اسم الإشعار',
                onChanged: (value) => setState(() => _query = value),
              ),
              Gap(AppSpacing.space12.h),
              Expanded(
                child: notifications.isEmpty
                    ? NotificationEmptyState(
                        isSearchResult: _notifications.isNotEmpty,
                      )
                    : ListView.separated(
                        padding: EdgeInsets.only(
                          top: AppSpacing.space4.h,
                          bottom: AppSpacing.space16.h,
                        ),
                        itemCount: notifications.length,
                        separatorBuilder: (_, _) => Gap(AppSpacing.space12.h),
                        itemBuilder: (context, index) {
                          final notification = notifications[index];
                          return NotificationListItem(
                            title: notification['title'] as String,
                            content: notification['content'] as String,
                            onTap: () => _openNotification(notification),
                          );
                        },
                      ),
              ),
              Gap(AppSpacing.space12.h),
              AppButton(
                text: 'إضافة إشعار',
                leading: Icon(
                  Icons.add_rounded,
                  size: 20.sp,
                  color: AppColors.white,
                ),
                backgroundColor: AppColors.success,
                foregroundColor: AppColors.white,
                onPressed: _addNotification,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
