
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features/profile/presentation/manage/account_editing_provider.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/shared/custom_text_field_name.dart';
import '../../../../../core/shared/custom_text_form_field.dart';


class ChangePasswordTextFields extends StatelessWidget {
  const ChangePasswordTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AccountEditingProvider>(context);
    return  Form(
      key: provider.passFormKey,
      child: Column(
        children: [
          verticalSpacer(40),
          const CustomTextFieldName(name: 'Password'),
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
          verticalSpacer(10),
          const CustomTextFieldName(name: 'Confirm Password'),
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
      ),
    );
  }
}