
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/core/utils/theme/app_colors.dart';
import 'package:untitled1/core/utils/theme/font_styles.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kBackGroundColor,
      titleTextStyle: FontStyles.font20WhiteBold,
      centerTitle: true,
      toolbarHeight: 60.h
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(size: 24.w),
    unselectedIconTheme: IconThemeData(size: 24.w),
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.kBackGroundColor,
    selectedItemColor: AppColors.kPrimaryColor,
    elevation: 0,
    unselectedItemColor: Colors.white,
  ),
  scaffoldBackgroundColor: AppColors.kBackGroundColor,
);

ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kSecondaryColor,
      titleTextStyle: FontStyles.font20WhiteBold.copyWith(
          color: Colors.black
      ),
      centerTitle: true,
      toolbarHeight: 60.h
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(size: 24.w),
    unselectedIconTheme: IconThemeData(size: 24.w),
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.kSecondaryColor,
    selectedItemColor: AppColors.kPrimaryColor,
    elevation: 0,
    unselectedItemColor: AppColors.kBackGroundColor,
  ),
  scaffoldBackgroundColor: AppColors.kSecondaryColor,
);

