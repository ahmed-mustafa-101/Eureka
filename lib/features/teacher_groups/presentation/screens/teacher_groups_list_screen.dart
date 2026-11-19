import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/teacher_groups/presentation/widgets/group_card_widget.dart';
import 'package:eureka/features/teacher_groups/presentation/widgets/groups_filter_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherGroupsListScreen extends StatefulWidget {
  const TeacherGroupsListScreen({super.key});

  @override
  State<TeacherGroupsListScreen> createState() =>
      _TeacherGroupsListScreenState();
}

class _TeacherGroupsListScreenState extends State<TeacherGroupsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Data directly inside the widget
  static final List<Map<String, dynamic>> _groupsData = [
    {
      'name': 'مجموعه أ',
      'subject': 'فيزياء',
      'studentsCount': 25,
      'lastSession': 'منذ يوم',
      'weeksCount': '10 اسبوع',
      'isPaid': false,
      'gradientColors': const [Color(0xFF0D47A1), Color(0xFF1976D2)],
      'icon': Icons.science_outlined,
    },
    {
      'name': 'مجموعه ب',
      'subject': 'فيزياء',
      'studentsCount': 20,
      'lastSession': 'منذ يومين',
      'weeksCount': '10 اسبوع',
      'isPaid': true,
      'gradientColors': const [Color(0xFF1A237E), Color(0xFF3949AB)],
      'icon': Icons.biotech_outlined,
    },
    {
      'name': 'مجموعه أ',
      'subject': 'كيمياء',
      'studentsCount': 30,
      'lastSession': 'منذ ساعتين',
      'weeksCount': '10 اسبوع',
      'isPaid': true,
      'gradientColors': const [Color(0xFF006064), Color(0xFF00838F)],
      'icon': Icons.bubble_chart_outlined,
    },
    {
      'name': 'مجموعه ج',
      'subject': 'فيزياء',
      'studentsCount': 18,
      'lastSession': 'منذ 3 ايام',
      'weeksCount': '10 اسبوع',
      'isPaid': false,
      'gradientColors': const [Color(0xFF2E7D32), Color(0xFF43A047)],
      'icon': Icons.psychology_outlined,
    },
  ];

  List<Map<String, dynamic>> get _filteredGroups {
    if (_searchQuery.trim().isEmpty) {
      return _groupsData;
    }
    final q = _searchQuery.trim().toLowerCase();
    return _groupsData.where((group) {
      final name = (group['name'] as String).toLowerCase();
      final subject = (group['subject'] as String).toLowerCase();
      return name.contains(q) || subject.contains(q);
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
      builder: (_) => const GroupsFilterSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = _filteredGroups;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'مجموعاتي',
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
                        textAlign: TextAlign.right,
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'بحث عن مجموعة...',
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
              // Groups Grid
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
                              'لا توجد مجموعات مطابقة للبحث',
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
                          childAspectRatio: 0.74,
                        ),
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          final item = filteredList[index];
                          return GroupCardWidget(
                            name: item['name'] as String,
                            subject: item['subject'] as String,
                            studentsCount: item['studentsCount'] as int,
                            lastSession: item['lastSession'] as String,
                            weeksCount: item['weeksCount'] as String,
                            isPaid: item['isPaid'] as bool,
                            gradientColors:
                                item['gradientColors'] as List<Color>,
                            icon: item['icon'] as IconData,
                            onTap: () => context.push(
                              AppRoutes.teacherGroupDetailScreen,
                              extra: item['name'] as String,
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('إضافة مجموعة')));
        },
        backgroundColor: AppColors.success,
        foregroundColor: AppColors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add_rounded, size: 28),
      ),
    );
  }
}
