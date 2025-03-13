
import 'package:flutter/material.dart';
import 'package:untitled1/core/helpers/cache_helper.dart';
import 'package:untitled1/core/helpers/exitentions.dart';
import 'package:untitled1/core/shared/customSnackBar.dart';
import 'package:untitled1/features/auth/data/models/login_model.dart';
import 'package:untitled1/features/auth/data/repo/login_repo.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/web_services/constants.dart';

class LoginProvider extends ChangeNotifier {
  var passController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isPassword = true;

  void isLoadingChange(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void isPasswordChange() {
    isPassword = !isPassword;
    notifyListeners();
  }

  Future<void> login(BuildContext context, context1) async {
    isLoadingChange(true);
    var message = await LoginRepo.getUserByEmailAndPassword(
      LoginModel(
        email: emailController.text,
        password: passController.text,
      ),
    );
    isLoadingChange(false);
    if (message == 'Success Login') {
      await CacheHelper.saveData(
        key: 'token',
        value: emailController.text,
      );
      email = CacheHelper.getData(key: 'token');
      customSnackBar(context1, message);
      if (context.mounted) {
        context.pushNamedAndRemoveUntil(
          Routes.layoutView,
          predicate: (route) => false,
        );
      }
    } else if (message == 'Incorrect password') {
      customSnackBar(context1, message);
    } else {
      customSnackBar(context1, message);
    }
  }
}