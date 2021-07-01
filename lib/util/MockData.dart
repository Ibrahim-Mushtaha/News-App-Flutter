import 'package:logger/logger.dart';
import 'package:newsapp/model/NavMenuItems.dart';
import 'package:newsapp/model/Welcome.dart';
import 'package:newsapp/other/StringConstant.dart';
import 'package:newsapp/view/drawer/headline.dart';
import 'package:newsapp/view/home/home.dart';
import 'package:newsapp/view/splash/onboarding.dart';
import 'package:newsapp/view/drawer/readlater.dart';
import 'package:newsapp/view/drawer/setting.dart';

class MockData{

  MockData._();
  static final MockData mockData = MockData._();
  static final logger = Logger();

  List<Welcome> getOnBoarding(){
    return <Welcome>[
      Welcome(
          description:
          "Making friends is easy as waving your hand and forth in easy step",
          image: image1),
      Welcome(description: "description 2", image: image2),
      Welcome(description: "description 3", image: image3),
    ];
  }

  List<NavMenuItems> navMenu = [
    NavMenuItems(EXPLORE, () => HomeScreen() ),
    NavMenuItems(HEAD_LINE, () => HeadLine() ),
    //NavMenuItems(READ_LATER, () => ReadLater() ),
    NavMenuItems(SETTINGS, () => Setting() ),
    NavMenuItems(LOGOUT, () => OnBoarding() ),
  ];

}