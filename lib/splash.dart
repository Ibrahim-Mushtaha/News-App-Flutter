import 'package:flutter/material.dart';
import 'package:newsapp/other/StringConstant.dart';
import 'package:newsapp/util/StorageManager.dart';
import 'package:newsapp/value/animate_do.dart';
import 'package:newsapp/view/home.dart';
import 'package:newsapp/view/onboarding.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    var delay = Duration(seconds: 3);

    Future.delayed(delay, () {
      bool seen = StorageManager.getBool(SEEN);
      if(seen == null || seen == false){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return OnBoarding();
        }
        )
        );
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return HomeScreen();
        }
        )
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ZoomIn(
          duration: Duration(milliseconds: 1500),
          animate: true,
          child: Center(
            child: Image.asset(
              'assets/images/ic_news_logo.png',
              height: 124,
              width: 124,
              fit:  BoxFit.fill,
            ),
          )
          ),
    );
  }
}
