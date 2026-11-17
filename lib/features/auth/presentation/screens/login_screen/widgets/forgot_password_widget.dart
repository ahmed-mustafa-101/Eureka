import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/typography/app_text_styles.dart';
import 'package:eureka/core/design_system/widgets/text/app_text.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: GestureDetector(
        onTap: onTap,
        child: AppText(
          'هل نسيت كلمة المرور؟',
          style: AppTextStyles.labelLarge.copyWith(
            fontFamily: AppTextStyles.bodyFontFamilyArabic,
            color: AppColors.success,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
