
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/theme/app_colors.dart';
import '../utils/theme/font_styles.dart';

class CustomTextFieldName extends StatelessWidget {
  const CustomTextFieldName({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 8.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          name,
          style: FontStyles.font16whiteMedium.copyWith(
            color: AppColors.kPrimaryColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}