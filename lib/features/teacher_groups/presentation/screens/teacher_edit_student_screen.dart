import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_radius.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_dropdown.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_text_field.dart';
import 'package:eureka/core/design_system/widgets/media/app_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherEditStudentScreen extends StatefulWidget {
  const TeacherEditStudentScreen({super.key, this.studentName = 'احمد السيد'});

  final String studentName;

  @override
  State<TeacherEditStudentScreen> createState() =>
      _TeacherEditStudentScreenState();
}

class _TeacherEditStudentScreenState extends State<TeacherEditStudentScreen> {
  // Data inside widget state
  late final TextEditingController _nameController;
  late final TextEditingController _attendanceController;
  late final TextEditingController _absencesController;
  late final TextEditingController _examGradeController;
  late final TextEditingController _homeworkGradeController;
  String? _selectedGroup = 'أ فيزياء';
  String? _selectedPaymentStatus = 'مدفوع';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.studentName);
    _attendanceController = TextEditingController(text: '95%');
    _absencesController = TextEditingController(text: '2');
    _examGradeController = TextEditingController(text: '95');
    _homeworkGradeController = TextEditingController(text: '8');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _attendanceController.dispose();
    _absencesController.dispose();
    _examGradeController.dispose();
    _homeworkGradeController.dispose();
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
          'تعديل بيانات الطالب',
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
        actions: [
          Padding(
            padding: EdgeInsets.all(AppSpacing.space8.r),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('حذف الطالب', textAlign: TextAlign.right),
                    content: const Text(
                      'هل أنت متأكد من حذف هذا الطالب من المجموعة؟',
                      textAlign: TextAlign.right,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: const Text('إلغاء'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                          context.pop();
                        },
                        child: Text(
                          'حذف',
                          style: TextStyle(color: AppColors.error),
                        ),
                      ),
                    ],
                  ),
                );
              },
              borderRadius: BorderRadius.circular(AppRadius.radiusFull),
              child: Container(
                width: 38.r,
                height: 38.r,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFEBEE),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.delete_outline_rounded,
                  size: 20.sp,
                  color: AppColors.error,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.space20.w),
                child: Column(
                  children: [
                    Gap(AppSpacing.space16.h),
                    // Centered Avatar & Name
                    AppAvatar(
                      radius: 46.r,
                      backgroundColor: const Color(0xFFD7E6DD),
                      child: Icon(
                        Icons.person,
                        size: 40.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Gap(AppSpacing.space12.h),
                    Text(
                      widget.studentName,
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Gap(AppSpacing.space24.h),
                    // Form fields
                    AppDropdown<String>(
                      label: 'المجموعة *',
                      hint: 'اختر المجموعة',
                      value: _selectedGroup,
                      items: const [
                        DropdownMenuItem(
                          value: 'أ فيزياء',
                          child: Text('أ فيزياء', textAlign: TextAlign.right),
                        ),
                        DropdownMenuItem(
                          value: 'ب فيزياء',
                          child: Text('ب فيزياء', textAlign: TextAlign.right),
                        ),
                        DropdownMenuItem(
                          value: 'أ كيمياء',
                          child: Text('أ كيمياء', textAlign: TextAlign.right),
                        ),
                      ],
                      onChanged: (v) => setState(() => _selectedGroup = v),
                    ),
                    Gap(AppSpacing.space16.h),
                    AppTextField(
                      label: 'نسبة الحضور *',
                      controller: _attendanceController,
                    ),
                    Gap(AppSpacing.space16.h),
                    AppTextField(
                      label: 'عدد الغيابات *',
                      controller: _absencesController,
                      keyboardType: TextInputType.number,
                    ),
                    Gap(AppSpacing.space16.h),
                    AppTextField(
                      label: 'درجة آخر امتحان *',
                      controller: _examGradeController,
                      keyboardType: TextInputType.number,
                    ),
                    Gap(AppSpacing.space16.h),
                    AppTextField(
                      label: 'درجة الواجبات *',
                      controller: _homeworkGradeController,
                      keyboardType: TextInputType.number,
                    ),
                    Gap(AppSpacing.space16.h),
                    AppDropdown<String>(
                      label: 'حالة الدفع *',
                      hint: 'اختر حالة الدفع',
                      value: _selectedPaymentStatus,
                      items: const [
                        DropdownMenuItem(
                          value: 'مدفوع',
                          child: Text('مدفوع', textAlign: TextAlign.right),
                        ),
                        DropdownMenuItem(
                          value: 'غير مدفوع',
                          child: Text('غير مدفوع', textAlign: TextAlign.right),
                        ),
                      ],
                      onChanged: (v) =>
                          setState(() => _selectedPaymentStatus = v),
                    ),
                    Gap(AppSpacing.space32.h),
                  ],
                ),
              ),
            ),
            // Bottom Submit Button
            Padding(
              padding: EdgeInsets.all(AppSpacing.space20.r),
              child: AppButton(
                text: 'تعديل',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('تم حفظ بيانات الطالب بنجاح'),
                      backgroundColor: AppColors.success,
                    ),
                  );
                  context.pop();
                },
                backgroundColor: AppColors.success,
                foregroundColor: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
