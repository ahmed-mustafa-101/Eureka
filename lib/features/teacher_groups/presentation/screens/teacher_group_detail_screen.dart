import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/teacher_groups/presentation/widgets/group_student_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherGroupDetailScreen extends StatefulWidget {
  const TeacherGroupDetailScreen({super.key, this.groupName = 'فيزياء أ'});

  final String groupName;

  @override
  State<TeacherGroupDetailScreen> createState() =>
      _TeacherGroupDetailScreenState();
}

class _TeacherGroupDetailScreenState extends State<TeacherGroupDetailScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Data directly inside the widget
  static final List<Map<String, dynamic>> _studentsData = [
    {'name': 'سارة حسين', 'hasPaid': true},
    {'name': 'احمد رضا', 'hasPaid': false},
    {'name': 'هند السيد', 'hasPaid': true},
    {'name': 'محمود حسن', 'hasPaid': false},
  ];

  List<Map<String, dynamic>> get _filteredStudents {
    if (_searchQuery.trim().isEmpty) {
      return _studentsData;
    }
    return _studentsData.where((student) {
      final name = (student['name'] as String).toLowerCase();
      return name.contains(_searchQuery.trim().toLowerCase());
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = _filteredStudents;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.groupName,
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
                size: 16,
                color: AppColors.success,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Gap(AppSpacing.space8.h),
            // Search & QR Code Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.space16.w),
              child: Row(
                children: [
                  // Search Field
                  Expanded(
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLowest,
                        borderRadius: BorderRadius.circular(
                          AppRadius.radius12.r,
                        ),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: TextField(
                        controller: _searchController,
                        textAlign: TextAlign.right,
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'بحث عن طالب...',
                          hintStyle: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textHint,
                          ),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: AppColors.textHint,
                            size: 20.sp,
                          ),
                          suffixIcon: _searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: Icon(
                                    Icons.close_rounded,
                                    size: 18.sp,
                                    color: AppColors.textSecondary,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _searchController.clear();
                                      _searchQuery = '';
                                    });
                                  },
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: AppSpacing.space12.h,
                            horizontal: AppSpacing.space12.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(AppSpacing.space8.w),

                  // QR Code Button
                  InkWell(
                    onTap: () => context.push(AppRoutes.teacherQrCodeScreen),
                    borderRadius: BorderRadius.circular(AppRadius.radius12.r),
                    child: Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        borderRadius: BorderRadius.circular(
                          AppRadius.radius12.r,
                        ),
                      ),
                      child: Icon(
                        Icons.qr_code_scanner_rounded,
                        color: AppColors.white,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(AppSpacing.space16.h),
            // Students List
            Expanded(
              child: filteredList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off_rounded,
                            size: 48.sp,
                            color: AppColors.textHint,
                          ),
                          Gap(AppSpacing.space8.h),
                          Text(
                            'لا توجد نتائج مطابقة للبحث',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.only(bottom: AppSpacing.space8.h),
                      itemCount: filteredList.length,
                      separatorBuilder: (context, index) => Divider(
                        height: 1,
                        thickness: 1,
                        color: AppColors.border.withValues(alpha: 0.6),
                        indent: AppSpacing.space16.w,
                        endIndent: AppSpacing.space16.w,
                      ),
                      itemBuilder: (context, index) {
                        final student = filteredList[index];
                        return GroupStudentTile(
                          name: student['name'] as String,
                          hasPaid: student['hasPaid'] as bool,
                          onTap: () => context.push(
                            AppRoutes.teacherStudentDetailScreen,
                            extra: student['name'] as String,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('إضافة طالب للمجموعة')));
        },
        backgroundColor: AppColors.success,
        foregroundColor: AppColors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add_rounded, size: 28),
      ),
    );
  }
}
