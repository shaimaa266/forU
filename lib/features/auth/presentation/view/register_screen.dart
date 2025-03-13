
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features/auth/presentation/view/widgets/have_account.dart';
import 'package:untitled1/features/auth/presentation/view/widgets/register_text_field.dart';
import 'package:untitled1/features/auth/presentation/view/widgets/term_conditions_screen.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/shared/custom_button.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/theme/font_styles.dart';
import '../../../profile/presentation/manage/app_theme_provider.dart';
import '../manage/register_provider.dart';

class ResisterScreen extends StatelessWidget {
  const ResisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RegisterProvider>(context);
    final isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    return ModalProgressHUD(
      inAsyncCall: provider.isLoading,
      color: AppColors.kPrimaryColor,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 33.h),
            child: Form(
              key: provider.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacer(10),
                  Text(
                    'Create Account',
                    style: FontStyles.font24PrimaryBold,
                  ),
                  verticalSpacer(10),
                  Text(
                    'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                    style: FontStyles.font14GrayRegular.copyWith(
                      color: isDarkTheme
                          ? Colors.white70
                          : AppColors.kBackGroundColor,
                    ),
                  ),
                  verticalSpacer(36),
                  const RegisterScreenTextFields(),
                  verticalSpacer(35),
                  CustomButton(
                    buttonName: 'Register',
                    onPressed: () async {
                      if (provider.formKey.currentState!.validate()) {
                        await provider.register(context);
                      }
                    },
                  ),
                  verticalSpacer(20),
                  const TermsConditions(),
                  verticalSpacer(30),
                  const HaveAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}