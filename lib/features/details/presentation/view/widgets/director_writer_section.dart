
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/font_styles.dart';
import '../../../../../core/utils/theme/font_wieght_helper.dart';



class DirectorWriterSec extends StatelessWidget {
  const DirectorWriterSec({super.key, required this.isDarkTheme, required this.writers, required this.director});
  final List<String> writers;
  final List<String> director;
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Director',
            style: FontStyles.font20WhiteBold.copyWith(
              fontWeight: FontWeight.w600,
              color: isDarkTheme ? null : AppColors.kBackGroundColor,
            ),
          ),
          verticalSpacer(5),
          ListView.separated(
            separatorBuilder: (context, index) => verticalSpacer(5),
            itemBuilder: (context, index) => Text(
              director[index],
              style: FontStyles.font14GrayRegular.copyWith(
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: director.length,
          ),
          verticalSpacer(15),
          Text(
            'Writers',
            style: FontStyles.font20WhiteBold.copyWith(
              fontWeight: FontWeight.w600,
              color: isDarkTheme ? null : AppColors.kBackGroundColor,
            ),
          ),
          verticalSpacer(5),
          ListView.separated(
            separatorBuilder: (context, index) => verticalSpacer(5),
            itemBuilder: (context, index) => Text(
              writers[index],
              overflow: TextOverflow.ellipsis,
              style: FontStyles.font14GrayRegular.copyWith(
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: writers.length,
          ),
        ],
      ),
    );
  }
}