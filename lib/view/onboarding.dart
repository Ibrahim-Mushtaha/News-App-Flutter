import 'package:flutter/material.dart';
import 'package:newsapp/model/Welcome.dart';
import 'package:newsapp/other/StringConstant.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  //todo button style
  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 16),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    minimumSize: Size(360, 56),
    onPrimary: Colors.red.shade800,
  );

  List<Welcome> welcome = [
    Welcome(
        description:
            "Making friends is easy as waving your hand and forth in easy step",
        image: image1),
    Welcome(description: "description 2", image: image2),
    Welcome(description: "description 3", image: image3),
  ];

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
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            welcome[index].description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
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
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: ElevatedButton(
              style: style,
              onPressed: () {
                print("buttom clicked");
              },
              onLongPress: () {
                print("buttom onLongPress clicked");
              },
              child: Text(
                'Enabled',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
