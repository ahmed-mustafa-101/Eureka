import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/app_bar/app_app_bar.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_text_field.dart';
import 'package:eureka/core/design_system/widgets/media/app_image_upload_area.dart';
import 'package:eureka/features/teacher_students/presentation/widgets/student_assignment_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherAddStudentScreen extends StatefulWidget {
  const TeacherAddStudentScreen({super.key});

  @override
  State<TeacherAddStudentScreen> createState() =>
      _TeacherAddStudentScreenState();
}

class _TeacherAddStudentScreenState extends State<TeacherAddStudentScreen> {
  static const List<String> _grades = [
    'الصف الأول الابتدائي',
    'الصف الثاني الابتدائي',
    'الصف الثالث الابتدائي',
    'الصف الرابع الابتدائي',
    'الصف الخامس الابتدائي',
    'الصف السادس الابتدائي',
  ];

  static const List<String> _availableGroups = [
    'مجموعة أ',
    'مجموعة ب',
    'مجموعة ج',
    'مجموعة د',
  ];

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _guardianPhoneController = TextEditingController();
  final List<String> _selectedGroups = ['مجموعة أ', 'مجموعة ب'];

  String _selectedGrade = _grades.first;
  String? _groupError;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _guardianPhoneController.dispose();
    super.dispose();
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }

  String? _phoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (value.trim().length != 11) {
      return 'رقم الهاتف يجب أن يتكون من 11 رقمًا';
    }
    return null;
  }

  Future<void> _showGroupsPicker() async {
    final selected = Set<String>.from(_selectedGroups);
    final result = await showModalBottomSheet<Set<String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setSheetState) => SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.space16.w,
              AppSpacing.space16.h,
              AppSpacing.space16.w,
              AppSpacing.space12.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'اختر المجموعات',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                Gap(AppSpacing.space12.h),
                for (final group in _availableGroups)
                  CheckboxListTile(
                    value: selected.contains(group),
                    activeColor: AppColors.success,
                    contentPadding: EdgeInsets.zero,
                    title: Text(group, textAlign: TextAlign.right),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isSelected) {
                      setSheetState(() {
                        if (isSelected == true) {
                          selected.add(group);
                        } else {
                          selected.remove(group);
                        }
                      });
                    },
                  ),
                Gap(AppSpacing.space8.h),
                AppButton(
                  text: 'تم',
                  backgroundColor: AppColors.success,
                  foregroundColor: AppColors.white,
                  onPressed: () => Navigator.pop(context, selected),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (result != null && mounted) {
      setState(() {
        _selectedGroups
          ..clear()
          ..addAll(_availableGroups.where(result.contains));
        _groupError = null;
      });
    }
  }

  void _createStudent() {
    final isValid = _formKey.currentState!.validate();
    setState(() {
      _groupError = _selectedGroups.isEmpty
          ? 'اختر مجموعة واحدة على الأقل'
          : null;
    });
    if (!isValid || _selectedGroups.isEmpty) return;

    context.pop(<String, dynamic>{
      'name': _nameController.text.trim(),
      'phone': _phoneController.text.trim(),
      'guardianPhone': _guardianPhoneController.text.trim(),
      'groups': List<String>.from(_selectedGroups),
      'grade': _selectedGrade,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppAppBar(
        title: Text('إضافة طالب'),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    AppSpacing.space16.w,
                    AppSpacing.space12.h,
                    AppSpacing.space16.w,
                    AppSpacing.space16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const _RequiredFieldLabel(text: 'اسم الطالب'),
                      Gap(AppSpacing.space8.h),
                      AppTextField(
                        controller: _nameController,
                        hintText: 'أحمد عماد محمد',
                        validator: _requiredValidator,
                      ),
                      Gap(AppSpacing.space16.h),
                      const _RequiredFieldLabel(text: 'رقم الطالب'),
                      Gap(AppSpacing.space8.h),
                      AppTextField(
                        controller: _phoneController,
                        hintText: '01020924779',
                        type: AppTextFieldType.phone,
                        maxLength: 11,
                        validator: _phoneValidator,
                      ),
                      Gap(AppSpacing.space12.h),
                      const _RequiredFieldLabel(text: 'صورة الطالب'),
                      Gap(AppSpacing.space8.h),
                      const AppImageUploadArea(title: 'اضغط لرفع صورة الطالب'),
                      Gap(AppSpacing.space16.h),
                      const _RequiredFieldLabel(text: 'رقم ولي الأمر'),
                      Gap(AppSpacing.space8.h),
                      AppTextField(
                        controller: _guardianPhoneController,
                        hintText: '01020924779',
                        type: AppTextFieldType.phone,
                        maxLength: 11,
                        validator: _phoneValidator,
                      ),
                      Gap(AppSpacing.space16.h),
                      const _RequiredFieldLabel(text: 'تعيين المجموعات'),
                      Gap(AppSpacing.space8.h),
                      StudentGroupsPicker(
                        selectedGroups: _selectedGroups,
                        errorText: _groupError,
                        onAddGroup: _showGroupsPicker,
                        onRemoveGroup: (group) {
                          setState(() {
                            _selectedGroups.remove(group);
                            _groupError = null;
                          });
                        },
                      ),
                      Gap(AppSpacing.space16.h),
                      const _RequiredFieldLabel(text: 'اختر الصف الدراسي'),
                      Gap(AppSpacing.space8.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.space16.w,
                          vertical: AppSpacing.space16.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceLowest,
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.textSecondary,
                              size: 22.sp,
                            ),
                            Expanded(
                              child: Text(
                                _selectedGrade,
                                textAlign: TextAlign.end,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(AppSpacing.space12.h),
                      StudentGradePicker(
                        grades: _grades,
                        selectedGrade: _selectedGrade,
                        onSelected: (grade) =>
                            setState(() => _selectedGrade = grade),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppSpacing.space16.r),
                child: AppButton(
                  text: 'إضافة الطالب',
                  backgroundColor: AppColors.success,
                  foregroundColor: AppColors.white,
                  onPressed: _createStudent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RequiredFieldLabel extends StatelessWidget {
  const _RequiredFieldLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: AppTextStyles.titleSmall.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(text: text),
          TextSpan(
            text: ' *',
            style: AppTextStyles.titleSmall.copyWith(color: AppColors.error),
          ),
        ],
      ),
    );
  }
}
