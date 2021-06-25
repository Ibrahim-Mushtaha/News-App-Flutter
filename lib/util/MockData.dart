
import 'package:newsapp/model/Welcome.dart';
import 'package:newsapp/other/StringConstant.dart';

class MockData{
  MockData._();
  static final MockData mockData = MockData._();

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
}