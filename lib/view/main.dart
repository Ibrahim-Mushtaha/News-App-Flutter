import 'package:flutter/material.dart';
import 'package:newsapp/view/splash/splash.dart';
import 'package:newsapp/util/StorageManager.dart';
import 'package:newsapp/util/ThemeBuilder.dart';
import 'package:newsapp/util/apptheme.dart';

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