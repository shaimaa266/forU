
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features/profile/presentation/manage/account_editing_provider.dart';
import 'package:untitled1/features/profile/presentation/view/widgets/account_view_text_field.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/shared/custom_button.dart';

class AccountEditingView extends StatelessWidget {
  const AccountEditingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My account"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Column(
            children: [
              verticalSpacer(40),
              const AccountViewTextFieldsSec(),
              verticalSpacer(30),
              Consumer<AccountEditingProvider>(
                builder: (context, value, child) {
                  return CustomButton(
                    buttonName: "Save changes",
                    onPressed: () {
                      if( context.read<AccountEditingProvider>().accountFormKey.currentState!.validate()){
                        context
                            .read<AccountEditingProvider>()
                            .updateUserData(context);
                      }
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}