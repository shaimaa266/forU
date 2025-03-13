
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/core/helpers/cache_helper.dart';
import 'package:untitled1/core/helpers/exitentions.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/shared/custom_button.dart';
import '../../../core/utils/theme/app_colors.dart';
import '../../../core/utils/theme/font_styles.dart';
import '../../profile/presentation/manage/app_theme_provider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpacer(30),
              Image.asset(
                'assets/images/onboarding2.png',
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              verticalSpacer(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Text('Welcome to 4U App!',
                    style: FontStyles.font25whiteMedium.copyWith(
                      color: appTheme
                          ? AppColors.kSecondaryColor
                          : AppColors.kBackGroundColor,
                    )),
              ),
              verticalSpacer(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                    textAlign: TextAlign.center,
                    'Discover, explore, and enjoy your favorite movies with our app. Whether you\'re a casual moviegoer or a die-hard film buff, we\'ve got something for everyone.',
                    style: FontStyles.font15WhiteMedium.copyWith(
                      color: appTheme
                          ? AppColors.kSecondaryColor
                          : AppColors.kBackGroundColor,
                    )),
              ),
              verticalSpacer(30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomButton(
                  buttonName: 'Enter now',
                  onPressed: () {
                    CacheHelper.saveData(key: 'onboarding', value: true).then(
                          (value) => context.pushNamedAndRemoveUntil(
                        Routes.registerView,
                        predicate: (route) => false,
                      ),
                    );
                  },
                ),
              ),
              verticalSpacer(30),
            ],
          ),
        ),
      ),
    );
  }
}