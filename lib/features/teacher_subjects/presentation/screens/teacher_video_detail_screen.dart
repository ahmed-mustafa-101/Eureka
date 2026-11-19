import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/features/teacher_subjects/presentation/widgets/attachment_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherVideoDetailScreen extends StatefulWidget {
  const TeacherVideoDetailScreen({
    super.key,
    this.videoTitle = 'شرح المعادلات للجزء الاول',
  });

  final String videoTitle;

  @override
  State<TeacherVideoDetailScreen> createState() =>
      _TeacherVideoDetailScreenState();
}

class _TeacherVideoDetailScreenState extends State<TeacherVideoDetailScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descController;

  static final List<Map<String, dynamic>> _attachmentsData = [
    {'fileName': 'قوانين نيوتن pdf', 'fileSize': '2.1 MB', 'fileType': 'pdf'},
    {'fileName': 'صورة الدرس jpg', 'fileSize': '1.4 MB', 'fileType': 'image'},
    {'fileName': 'المعادلات mp4', 'fileSize': '15.0 MB', 'fileType': 'video'},
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.videoTitle);
    _descController = TextEditingController(
      text: 'في هذا الفيديو سنتعرف على مفهوم المعادلات الخطية وكيفية حلها بطرق مبسطة مع أمثلة وتطبيقات عملية شاملة.',
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'تفاصيل الفيديو',
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
              Gap(AppSpacing.space8.h),
              // Breadcrumb path
              Center(
                child: Text(
                  'رياضيات > الجبر > المعادلات الخطية',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.success,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp,
                  ),
                ),
              ),
              Gap(AppSpacing.space12.h),
              // Video Player Preview
              Container(
                width: double.infinity,
                height: 190.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E252B),
                  borderRadius: BorderRadius.circular(AppRadius.radius16.r),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Frame.png'),
                    fit: BoxFit.cover,
                    opacity: 0.25,
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 52.r,
                        height: 52.r,
                        decoration: BoxDecoration(
                          color: AppColors.success,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.success.withValues(alpha: 0.4),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: AppColors.white,
                          size: 32.sp,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10.h,
                      left: 12.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.black.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          '15:45',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.white,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(AppSpacing.space20.h),
              // Video Title Label & Box
              Text(
                'اسم الفيديو',
                style: AppTextStyles.labelMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Gap(AppSpacing.space8.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.space16.w,
                  vertical: AppSpacing.space12.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLowest,
                  borderRadius: BorderRadius.circular(AppRadius.radius12.r),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  _titleController.text,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              Gap(AppSpacing.space16.h),
              // Description Label & Box
              Text(
                'الوصف',
                style: AppTextStyles.labelMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Gap(AppSpacing.space8.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.space16.w,
                  vertical: AppSpacing.space12.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLowest,
                  borderRadius: BorderRadius.circular(AppRadius.radius12.r),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  _descController.text,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.5,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Gap(AppSpacing.space20.h),
              // Attached Files Section
              Text(
                'الملفات المرفقة',
                style: AppTextStyles.labelMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Gap(AppSpacing.space8.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _attachmentsData.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSpacing.space8.h),
                itemBuilder: (context, index) {
                  final att = _attachmentsData[index];
                  return AttachmentItemTile(
                    fileName: att['fileName'] as String,
                    fileSize: att['fileSize'] as String,
                    fileType: att['fileType'] as String,
                    onEdit: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('تعديل ملف: ${att['fileName']}'),
                        ),
                      );
                    },
                    onDelete: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('حذف ملف: ${att['fileName']}'),
                          backgroundColor: AppColors.error,
                        ),
                      );
                    },
                  );
                },
              ),
              Gap(AppSpacing.space32.h),
            ],
          ),
        ),
      ),
    );
  }
}
