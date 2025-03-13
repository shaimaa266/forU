
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/core/helpers/cache_helper.dart';
import 'package:untitled1/core/helpers/exitentions.dart';
import 'package:untitled1/features/profile/presentation/manage/app_theme_provider.dart';
import 'package:untitled1/features/profile/presentation/view/widgets/profile_edit_account.dart';
import 'package:untitled1/features/profile/presentation/view/widgets/profile_second_container.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/shared/custom_button.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            children: [
              ProfileEditAccountSec(isDarkTheme: isDarkTheme),
              verticalSpacer(30),
              const ProfileSecondContainerSec(),
              verticalSpacer(30),
              CustomButton(
                buttonName: "Log out",
                onPressed: () {
                  logoutDialog(context);
                },
              ),
              verticalSpacer(40),
            ],
          ),
        ),
    );
  }

  void logoutDialog(BuildContext context){
    AwesomeDialog(
      context: context,
      title: 'Are you sure you want to logout ?',
      desc:"If you logged out you would need to re-enter the Email and password if you want to enter again. ",
      animType: AnimType.bottomSlide,
      btnCancelOnPress: () {},
      dialogType: DialogType.question,
      btnOkText: 'Yes',
      btnCancelText:'No' ,
      btnOkOnPress: () {
        CacheHelper.removeData(key: 'token');
        context.pushNamedAndRemoveUntil(Routes.loginView,
            predicate: (route) => false);
      },

    ).show();
  }
}