import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/Welcome.dart';
import 'package:newsapp/util/MockData.dart';
import 'package:newsapp/view/home/home.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  //todo button style
  final ButtonStyle _style = ButtonStyle(
    minimumSize: MaterialStateProperty.all(Size(360, 56),),
    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
    backgroundColor:  MaterialStateProperty.all(Colors.deepOrangeAccent),
  );

  // todo call instance data from singleton
  List<Welcome> welcome = MockData.mockData.getOnBoarding();

  int _currentIndex = 0;

  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  //todo here we use container to set a background color & image
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(
                            welcome[index].image ?? "assets/images/bg_1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black45.withOpacity(0.5),
                  ),
                  //todo here we will put the logo and the welcome text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.translate(
                        child: Icon(
                          Icons.ac_unit,
                          size: 140,
                          color: Colors.white,
                        ),
                        offset: Offset(0, -100),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          "Welcome!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16,right: 24,left: 24),
                          child: Text(
                            welcome[index].description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: 3,
            onPageChanged: (index){
              _pageViewNotifier.value = index;
            },
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Transform.translate(
            offset: Offset(0, 165),
            child: _displayPageIndicators(welcome.length),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: ElevatedButton(
              style: _style,
              onPressed: () {
                _updateSeen();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //todo update seen
                  return HomeScreen();
                } ));
                print("button clicked");
              },
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _displayPageIndicators(int length ){
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }


  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }

}
