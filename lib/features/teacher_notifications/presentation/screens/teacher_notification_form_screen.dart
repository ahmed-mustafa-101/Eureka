import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/app_bar/app_app_bar.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_dropdown.dart';
import 'package:eureka/core/design_system/widgets/inputs/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

class TeacherNotificationFormScreen extends StatefulWidget {
  const TeacherNotificationFormScreen({super.key, this.notification});

  final Map<String, dynamic>? notification;

  @override
  State<TeacherNotificationFormScreen> createState() =>
      _TeacherNotificationFormScreenState();
}

class _TeacherNotificationFormScreenState
    extends State<TeacherNotificationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  late String _selectedGrade;
  late String _selectedGroup;

  bool get _isEditing => widget.notification != null;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.notification?['title'] as String? ?? '',
    );
    _contentController = TextEditingController(
      text: widget.notification?['content'] as String? ?? '',
    );
    _selectedGrade =
        widget.notification?['grade'] as String? ?? 'الصف الأول الثانوي';
    _selectedGroup =
        widget.notification?['group'] as String? ?? 'مجموعة أ فيزياء';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final notification = <String, dynamic>{
      'title': _titleController.text.trim(),
      'content': _contentController.text.trim(),
      'grade': _selectedGrade,
      'group': _selectedGroup,
      'date': widget.notification?['date'] ?? '19 نوفمبر 2026',
      'attachments': widget.notification?['attachments'] ?? <String>[],
    };
    Navigator.of(context).pop(notification);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppAppBar(
        title: Text(_isEditing ? 'تعديل الإشعار' : 'إضافة إشعار'),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.space16.w,
                    vertical: AppSpacing.space16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _RequiredLabel(text: 'عنوان الإشعار'),
                      Gap(AppSpacing.space8.h),
                      AppTextField(
                        controller: _titleController,
                        hintText: 'اكتب عنوان الإشعار',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'يرجى إدخال عنوان الإشعار';
                          }
                          return null;
                        },
                      ),
                      Gap(AppSpacing.space16.h),
                      _RequiredLabel(text: 'محتوى الإشعار'),
                      Gap(AppSpacing.space8.h),
                      AppTextField(
                        controller: _contentController,
                        hintText: 'اكتب تفاصيل الإشعار هنا',
                        type: AppTextFieldType.multiline,
                        minLines: 4,
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'يرجى إدخال محتوى الإشعار';
                          }
                          return null;
                        },
                      ),
                      Gap(AppSpacing.space16.h),
                      _RequiredLabel(text: 'اختر الصف الدراسي'),
                      Gap(AppSpacing.space8.h),
                      AppDropdown<String>(
                        value: _selectedGrade,
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
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _selectedGrade = value);
                          }
                        },
                      ),
                      Gap(AppSpacing.space16.h),
                      _RequiredLabel(text: 'اختر المجموعة'),
                      Gap(AppSpacing.space8.h),
                      AppDropdown<String>(
                        value: _selectedGroup,
                        items: const [
                          DropdownMenuItem(
                            value: 'مجموعة أ فيزياء',
                            child: Text('مجموعة أ فيزياء'),
                          ),
                          DropdownMenuItem(
                            value: 'مجموعة ب رياضيات',
                            child: Text('مجموعة ب رياضيات'),
                          ),
                          DropdownMenuItem(
                            value: 'مجموعة ج كيمياء',
                            child: Text('مجموعة ج كيمياء'),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _selectedGroup = value);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppSpacing.space16.r),
                child: AppButton(
                  text: _isEditing ? 'تعديل' : 'إرسال',
                  backgroundColor: AppColors.success,
                  foregroundColor: AppColors.white,
                  onPressed: _submit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RequiredLabel extends StatelessWidget {
  const _RequiredLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: AppTextStyles.labelMedium.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(text: text),
          TextSpan(
            text: ' *',
            style: AppTextStyles.labelMedium.copyWith(color: AppColors.error),
          ),
        ],
      ),
    );
  }
}
