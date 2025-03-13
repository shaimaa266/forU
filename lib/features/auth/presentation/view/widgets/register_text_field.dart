
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features/auth/presentation/manage/register_provider.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/shared/custom_text_form_field.dart';

class RegisterScreenTextFields extends StatelessWidget {
  const RegisterScreenTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RegisterProvider>(context);
    return Column(
      children: [
        CustomTextFormField(
          controller: provider.fNameController,
          hintText: 'First Name',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
          },
        ),
        verticalSpacer(20),
        CustomTextFormField(
          controller: provider.sNameController,
          hintText: 'Last Name',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
          },
        ),
        verticalSpacer(20),
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
          hintText: 'Password',
          suffixIcon: provider.isPassword
              ? Icons.visibility_off
              : Icons.visibility,
          isObscureText: provider.isPassword,
          suffixIconTap: provider.isPasswordChange,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
          },
        ),
        verticalSpacer(20),
        CustomTextFormField(
          controller: provider.confirmPassController,
          hintText: 'Confirm Password',
          isObscureText: provider.isPassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            } else if (value != provider.passController.text) {
              return 'Passwords are not same';
            }
          },
        ),
      ],
    );
  }
}