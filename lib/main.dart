import 'package:flutter/material.dart';
import 'package:newsapp/util/StorageManager.dart';
import 'package:newsapp/util/ThemeBuilder.dart';
import 'package:newsapp/util/apptheme.dart';
import 'package:newsapp/view/onboarding.dart';
import 'package:newsapp/view/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();
  bool seen = StorageManager.getBool('seen');
  Widget _screen;
  if(seen == null || seen == false){
    _screen = OnBoarding();
  }else{
    _screen = HomeScreen();
  }

  runApp( NewsApp( _screen ) );
}

class NewsApp extends StatelessWidget {

  final Widget _screen;
  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultBrightness: Brightness.light,
      builder: (context, _brightness) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: _brightness,
          fontFamily: "Tajawal-Regular",
        ),
        home: _screen,
      ),
    );
  }
}