
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/core/helpers/exitentions.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/font_styles.dart';
import '../../../../profile/presentation/manage/app_theme_provider.dart';


class DonNotHaveAccount extends StatelessWidget {
  const DonNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: FontStyles.font13GrayRegular.copyWith(
              color: isDarkTheme ?   Colors.grey:AppColors.kBackGroundColor,

            ),
          ),
          TextSpan(
            text: '  Sign Up',
            style: FontStyles.font14GraySemiBold.copyWith(
              color: isDarkTheme ? Colors.white70 :AppColors.kBackGroundColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.pushReplacementNamed(Routes.registerView),
          )
        ]),
      ),
    );
  }
}