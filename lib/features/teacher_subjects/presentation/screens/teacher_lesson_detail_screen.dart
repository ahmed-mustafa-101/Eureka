import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/teacher_subjects/presentation/widgets/attachment_item_tile.dart';
import 'package:eureka/features/teacher_subjects/presentation/widgets/video_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherLessonDetailScreen extends StatelessWidget {
  const TeacherLessonDetailScreen({
    super.key,
    this.lessonTitle = 'المعادلات الخطية',
  });

  final String lessonTitle;

  // Data directly inside the widget
  static final List<Map<String, dynamic>> _videosData = [
    {
      'title': 'حل المعادلات الخطية (1)',
      'chapterName': 'الفصل الاول',
      'duration': '15:45',
    },
    {
      'title': 'المعادلات الخطية',
      'chapterName': 'الفصل الاول',
      'duration': '12:30',
    },
    {
      'title': 'مفهوم المعادلة الخطية',
      'chapterName': 'الفصل الاول',
      'duration': '18:20',
    },
  ];

  static final List<Map<String, dynamic>> _filesData = [
    {'fileName': 'قوانين نيوتن pdf', 'fileSize': '2.1 MB', 'fileType': 'pdf'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'تفاصيل الدرس',
          style: AppTextStyles.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.all(AppSpacing.space8.r),
          child: InkWell(
            onTap: () => context.pop(),
            borderRadius: BorderRadius.circular(AppRadius.radiusFull),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFD7E6DD),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back,
                size: 18,
                color: AppColors.success,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.space16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(AppSpacing.space12.h),
              // Hero Green Banner
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(AppSpacing.space20.r),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2E7D4E), Color(0xFF388E3C)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(AppRadius.radius20.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2E7D4E).withValues(alpha: 0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Graphic/Blackboard Illustration
                    Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(
                          AppRadius.radius16.r,
                        ),
                      ),
                      child: Icon(
                        Icons.co_present_rounded,
                        size: 44.sp,
                        color: AppColors.white,
                      ),
                    ),
                    Gap(AppSpacing.space16.w),
                    // Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lessonTitle,
                            style: AppTextStyles.headlineLarge.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                            ),
                          ),
                          Gap(AppSpacing.space4.h),
                          Text(
                            'رياضيات > الجبر > المعادلات الخطية',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.white.withValues(alpha: 0.85),
                              fontSize: 10.5.sp,
                            ),
                          ),
                          Gap(AppSpacing.space8.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSpacing.space8.w,
                              vertical: AppSpacing.space2.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(
                                AppRadius.radiusFull,
                              ),
                            ),
                            child: Text(
                              '3 فيديوهات',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(AppSpacing.space24.h),
              // Section 1: الفيديوهات (3)
              Text(
                'الفيديوهات (${_videosData.length})',
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Gap(AppSpacing.space12.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _videosData.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSpacing.space8.h),
                itemBuilder: (context, index) {
                  final video = _videosData[index];
                  return VideoItemCard(
                    title: video['title'] as String,
                    chapterName: video['chapterName'] as String,
                    duration: video['duration'] as String,
                    onTap: () => context.push(
                      AppRoutes.teacherVideoDetailScreen,
                      extra: video['title'] as String,
                    ),
                  );
                },
              ),
              Gap(AppSpacing.space24.h),
              // Section 2: الملفات (1)
              Text(
                'الملفات (${_filesData.length})',
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Gap(AppSpacing.space12.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _filesData.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSpacing.space8.h),
                itemBuilder: (context, index) {
                  final file = _filesData[index];
                  return AttachmentItemTile(
                    fileName: file['fileName'] as String,
                    fileSize: file['fileSize'] as String,
                    fileType: file['fileType'] as String,
                  );
                },
              ),
              Gap(AppSpacing.space24.h),
            ],
          ),
        ),
      ),
    );
  }
}
