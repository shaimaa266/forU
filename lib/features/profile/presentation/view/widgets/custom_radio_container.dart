
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features/profile/presentation/manage/app_theme_provider.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/font_styles.dart';


class CustomRadioContainer extends StatelessWidget {
  const CustomRadioContainer({
    super.key,
    this.onPressed,
    required this.name,
    required this.leading,
    required this.isSelected,
  });

  final void Function()? onPressed;
  final String name;
  final String leading;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          verticalSpacer(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                leading,
                style: FontStyles.font18BlackMedium.copyWith(
                  fontWeight: FontWeight.w400,
                  color: isDarkTheme ? AppColors.kPrimaryColor : null,
                ),
              ),
              horizontalSpacer(24),
              Text(
                name,
                style: FontStyles.font16whiteMedium.copyWith(
                  fontWeight: FontWeight.w400,
                  color: isDarkTheme ? AppColors.kPrimaryColor : null,
                ),
              ),
              const Spacer(),
              if (isSelected == true)
                Icon(
                  Icons.check,
                  size: 20.w,
                  color: AppColors.kPrimaryColor,
                )
            ],
          ),
          verticalSpacer(10),
          Divider(
            thickness: 0.5.w,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}