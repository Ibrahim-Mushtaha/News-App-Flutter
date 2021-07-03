
import 'package:get/get.dart';
import 'package:newsapp/model/whatsnew/News.dart';
import 'package:newsapp/service/service.dart';
import 'package:newsapp/util/MockData.dart';

class HeadLineAppController extends GetxController {

  var getHeadLine = News().obs;
  var postLoading = true.obs;
  Services services = Services();

  @override
  void onInit() {
    callHeadLineMethod();
    super.onInit();
  }

  void callHeadLineMethod() async{
    try {
      postLoading.value = true;
      var result = await MockData.services.getHeadLine();
      if(result != null)
        getHeadLine.value = result;
      else
        MockData.logger.e("data is null");
    } finally {
      postLoading.value = false;
    }
    update();
  }

}