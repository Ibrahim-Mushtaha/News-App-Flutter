import 'package:flutter/material.dart';
import 'package:newsapp/splash.dart';
import 'package:newsapp/util/StorageManager.dart';
import 'package:newsapp/util/ThemeBuilder.dart';
import 'package:newsapp/util/apptheme.dart';
import 'package:newsapp/view/onboarding.dart';
import 'package:newsapp/view/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();

  runApp( NewsApp() );
}

class NewsApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultBrightness: Brightness.light,
      builder: (context, _brightness) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(),
        home: Splash(),
      ),
    );
  }
}