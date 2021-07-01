
import 'package:flutter/material.dart';
import 'package:newsapp/util/StorageManager.dart';
import 'package:newsapp/util/StorageManager.dart';

import 'StorageManager.dart';

class AppTheme {

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    fontFamily: "Tajawal-Regular",
  );

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.deepOrangeAccent,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
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