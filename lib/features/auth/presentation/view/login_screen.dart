

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features/auth/presentation/manage/login_provider.dart';
import 'package:untitled1/features/auth/presentation/view/widgets/dont_have_account.dart';
import 'package:untitled1/features/auth/presentation/view/widgets/term_conditions_screen.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/shared/custom_button.dart';
import '../../../../core/shared/custom_text_form_field.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/theme/font_styles.dart';
import '../../../profile/presentation/manage/app_theme_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    var provider = Provider.of<LoginProvider>(context, listen: true);
    return ModalProgressHUD(
      inAsyncCall: provider.isLoading,
      blur: 2,
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
                  verticalSpacer(30),
                  Text(
                    'Welcome Back',
                    style: FontStyles.font24PrimaryBold,
                  ),
                  verticalSpacer(10),
                  Text(
                    'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                    style: FontStyles.font14GrayRegular.copyWith(
                      color: isDarkTheme
                          ? Colors.grey
                          : AppColors.kBackGroundColor,
                    ),
                  ),
                  verticalSpacer(36),
                  CustomTextFormField(
                    controller: provider.emailController,
                    hintText: 'Email',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isEmailValid(value)) {
                        return 'Please enter a valid email';
                      }
                    },
                  ),
                  verticalSpacer(20),
                  CustomTextFormField(
                    controller: provider.passController,
                    suffixIcon: provider.isPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    isObscureText: provider.isPassword,
                    suffixIconTap: provider.isPasswordChange,
                    hintText: 'Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                    },
                  ),
                  verticalSpacer(24),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget Password?',
                      style: FontStyles.font14GraySemiBold.copyWith(
                        color: isDarkTheme
                            ? Colors.white70
                            : AppColors.kBackGroundColor,
                      ),
                    ),
                  ),
                  verticalSpacer(35),
                  CustomButton(
                    buttonName: 'Login',
                    onPressed: () async {
                      if (provider.formKey.currentState!.validate()) {
                        await provider.login(context, context);
                      }
                    },
                  ),
                  verticalSpacer(20),
                  const TermsConditions(),
                  verticalSpacer(60),
                  const  DonNotHaveAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}