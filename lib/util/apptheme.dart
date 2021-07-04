import 'package:flutter/material.dart';
import 'package:newsapp/other/ColorsConstant.dart';
import 'package:newsapp/util/StorageManager.dart';
import 'StorageManager.dart';

class AppTheme {

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: AppColors.deepBlack,
    brightness: Brightness.dark,
    backgroundColor: AppColors.softBlack,
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: AppColors.softBlack),
    dividerColor: Colors.black12,
    fontFamily: "Tajawal-Regular",
  );

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: AppColors.deepBlue,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: AppColors.deepBlack,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    fontFamily: "Tajawal-Regular",
  );

  static ThemeData getTheme() {
    if (StorageManager.getBool("theme") != null &&
        StorageManager.getBool("theme") == true) {
      return darkTheme;
    } else {
      return lightTheme;
    }
  }




}