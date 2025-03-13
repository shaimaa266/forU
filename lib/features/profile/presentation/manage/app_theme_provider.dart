
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/core/helpers/cache_helper.dart';

import '../../../../core/utils/theme/app_colors.dart';

class AppThemeProvider extends ChangeNotifier{
  bool isDarkTheme=CacheHelper.getData(key: 'isDarkTheme') ?? true;

  void changeTheme(){
    isDarkTheme = !isDarkTheme;
    CacheHelper.saveData(key: 'isDarkTheme', value: isDarkTheme);
    notifyListeners();
  }

  void getStatusBar(){
    isDarkTheme
        ? SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: AppColors.kBackGroundColor))
        : SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
  }

}