import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/app_bar/app_app_bar.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_dropdown.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_text_field.dart';
import 'package:eureka/core/design_system/widgets/media/app_image_upload_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TeacherAddGroupScreen extends StatefulWidget {
  const TeacherAddGroupScreen({super.key});

  @override
  State<TeacherAddGroupScreen> createState() => _TeacherAddGroupScreenState();
}

class _TeacherAddGroupScreenState extends State<TeacherAddGroupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _teacherController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _selectedGrade;
  String _selectedSubject = 'فيزياء';

  @override
  void dispose() {
    _nameController.dispose();
    _teacherController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _createGroup() {
    if (!_formKey.currentState!.validate()) return;

    context.pop(<String, dynamic>{
      'name': _nameController.text.trim(),
      'grade': _selectedGrade,
      'subject': _selectedSubject,
      'teacherName': _teacherController.text.trim(),
      'description': _descriptionController.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppAppBar(
        title: Text('إضافة مجموعة'),
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
                      _RequiredFieldLabel(text: 'اسم المجموعة'),
                      Gap(AppSpacing.space8.h),
                      AppTextField(
                        controller: _nameController,
                        hintText: 'مثال: مجموعة أ',
                        validator: _requiredValidator,
                      ),
                      Gap(AppSpacing.space16.h),
                      _RequiredFieldLabel(text: 'اختر الصف الدراسي'),
                      Gap(AppSpacing.space8.h),
                      AppDropdown<String>(
                        value: _selectedGrade,
                        hint: 'اختر الصف',
                        items: const [
                          DropdownMenuItem(
                            value: 'الصف الأول الثانوي',
                            child: Text('الصف الأول الثانوي'),
                          ),
                          DropdownMenuItem(
                            value: 'الصف الثاني الثانوي',
                            child: Text('الصف الثاني الثانوي'),
                          ),
                          DropdownMenuItem(
                            value: 'الصف الثالث الثانوي',
                            child: Text('الصف الثالث الثانوي'),
                          ),
                        ],
                        validator: (value) =>
                            value == null ? 'يرجى اختيار الصف الدراسي' : null,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _selectedGrade = value);
                          }
                        },
                      ),
                      Gap(AppSpacing.space16.h),
                      _RequiredFieldLabel(text: 'صورة المجموعة'),
                      Gap(AppSpacing.space8.h),
                      const AppImageUploadArea(
                        title: 'اضغط لرفع صورة المجموعة',
                      ),
                      Gap(AppSpacing.space16.h),
                      _RequiredFieldLabel(text: 'اختر المادة'),
                      Gap(AppSpacing.space8.h),
                      AppDropdown<String>(
                        value: _selectedSubject,
                        items: const [
                          DropdownMenuItem(
                            value: 'فيزياء',
                            child: Text('فيزياء'),
                          ),
                          DropdownMenuItem(
                            value: 'كيمياء',
                            child: Text('كيمياء'),
                          ),
                          DropdownMenuItem(
                            value: 'رياضيات',
                            child: Text('رياضيات'),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _selectedSubject = value);
                          }
                        },
                      ),
                      Gap(AppSpacing.space16.h),
                      _RequiredFieldLabel(text: 'اسم المدرس'),
                      Gap(AppSpacing.space8.h),
                      AppTextField(
                        controller: _teacherController,
                        hintText: 'اكتب اسم المدرس',
                        validator: _requiredValidator,
                      ),
                      Gap(AppSpacing.space16.h),
                      _RequiredFieldLabel(text: 'وصف المجموعة'),
                      Gap(AppSpacing.space8.h),
                      AppTextField(
                        controller: _descriptionController,
                        hintText: 'وصف بسيط للمجموعة',
                        type: AppTextFieldType.multiline,
                        minLines: 4,
                        maxLines: 5,
                        validator: _requiredValidator,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppSpacing.space16.r),
                child: AppButton(
                  text: 'إنشاء المجموعة',
                  backgroundColor: AppColors.success,
                  foregroundColor: AppColors.white,
                  onPressed: _createGroup,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
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
