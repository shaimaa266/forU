
import 'package:flutter/material.dart';
import 'package:untitled1/core/helpers/cache_helper.dart';
import 'package:untitled1/core/shared/customSnackBar.dart';
import 'package:untitled1/features/auth/data/models/register_model.dart';
import 'package:untitled1/features/auth/data/repo/register_repo.dart';

class RegisterProvider extends ChangeNotifier {
  var fNameController = TextEditingController();
  var sNameController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
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

  Future<void> register(context) async {
    isLoadingChange(true);
    final existingUsers =
    await RegisterRepo.getUsersByEmail(emailController.text);
    notifyListeners();
    if (existingUsers.isNotEmpty) {
      isLoadingChange(false);
      customSnackBar(context, 'This Email already exists');
      notifyListeners();
    } else {
      isLoadingChange(true);
      await RegisterRepo.register(
          RegisterModel(
            firstName: fNameController.text,
            lastName: sNameController.text,
            email: emailController.text,
            password: passController.text,
            confirmPassword: confirmPassController.text,
          ),
          context);
      await CacheHelper.saveData(
        key: 'token',
        value: emailController.text,
      );
      isLoadingChange(false);
      notifyListeners();
    }
  }
}