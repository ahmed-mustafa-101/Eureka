import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/teacher_subjects/presentation/widgets/subject_card_widget.dart';
import 'package:eureka/features/teacher_subjects/presentation/widgets/subjects_filter_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherSubjectsListScreen extends StatefulWidget {
  const TeacherSubjectsListScreen({super.key});

  @override
  State<TeacherSubjectsListScreen> createState() =>
      _TeacherSubjectsListScreenState();
}

class _TeacherSubjectsListScreenState extends State<TeacherSubjectsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Data directly inside the widget (no Models)
  static final List<Map<String, dynamic>> _subjectsData = [
    {
      'name': 'الفيزياء',
      'grade': 'الصف: الثالث الثانوي',
      'unitsCount': 5,
      'groupsCount': 3,
      'filesCount': 11,
      'gradientColors': const [Color(0xFF0D47A1), Color(0xFF1976D2)],
      'icon': Icons.science_outlined,
    },
    {
      'name': 'الكيمياء',
      'grade': 'الصف: الثالث الثانوي',
      'unitsCount': 4,
      'groupsCount': 2,
      'filesCount': 9,
      'gradientColors': const [Color(0xFF006064), Color(0xFF00838F)],
      'icon': Icons.biotech_outlined,
    },
    {
      'name': 'الأحياء',
      'grade': 'الصف: الثالث الثانوي',
      'unitsCount': 6,
      'groupsCount': 4,
      'filesCount': 14,
      'gradientColors': const [Color(0xFF1B5E20), Color(0xFF388E3C)],
      'icon': Icons.psychology_outlined,
    },
    {
      'name': 'الرياضيات',
      'grade': 'الصف: الثالث الثانوي',
      'unitsCount': 5,
      'groupsCount': 3,
      'filesCount': 11,
      'gradientColors': const [Color(0xFFE65100), Color(0xFFF57C00)],
      'icon': Icons.calculate_outlined,
    },
    {
      'name': 'الإنجليزية',
      'grade': 'الصف: الثالث الثانوي',
      'unitsCount': 8,
      'groupsCount': 5,
      'filesCount': 16,
      'gradientColors': const [Color(0xFF1A237E), Color(0xFF303F9F)],
      'icon': Icons.translate_rounded,
    },
  ];

  List<Map<String, dynamic>> get _filteredSubjects {
    if (_searchQuery.trim().isEmpty) {
      return _subjectsData;
    }
    final q = _searchQuery.trim().toLowerCase();
    return _subjectsData.where((subject) {
      final name = (subject['name'] as String).toLowerCase();
      final grade = (subject['grade'] as String).toLowerCase();
      return name.contains(q) || grade.contains(q);
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const SubjectsFilterSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = _filteredSubjects;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'موادي',
          style: AppTextStyles.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.space16.w),
          child: Column(
            children: [
              Gap(AppSpacing.space8.h),
              // Search & Filter Row
              Row(
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
                        textAlign: TextAlign.start,
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'بحث...',
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

                  // Filter Button
                  InkWell(
                    onTap: () => _showFilterSheet(context),
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
                        Icons.tune_rounded,
                        color: AppColors.white,
                        size: 22.sp,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(AppSpacing.space16.h),
              // Subjects Grid
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
                              'لا توجد مواد مطابقة للبحث',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      )
                    : GridView.builder(
                        padding: EdgeInsets.only(bottom: AppSpacing.space8.h),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: AppSpacing.space12.w,
                          mainAxisSpacing: AppSpacing.space12.h,
                          childAspectRatio: 0.72,
                        ),
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          final subject = filteredList[index];
                          return SubjectCardWidget(
                            name: subject['name'] as String,
                            grade: subject['grade'] as String,
                            unitsCount: subject['unitsCount'] as int,
                            groupsCount: subject['groupsCount'] as int,
                            filesCount: subject['filesCount'] as int,
                            gradientColors:
                                subject['gradientColors'] as List<Color>,
                            icon: subject['icon'] as IconData,
                            onTap: () => context.push(
                              AppRoutes.teacherUnitsScreen,
                              extra: subject['name'] as String,
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
