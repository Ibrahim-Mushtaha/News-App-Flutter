
import 'package:get/get.dart';
import 'package:newsapp/model/whatsnew/News.dart';
import 'package:newsapp/service/service.dart';
import 'package:newsapp/util/MockData.dart';

class PopularAppController extends GetxController {

  var getPopular = News().obs;
  var newsLoading = true.obs;
  Services services = Services();

  @override
  void onInit() {
    callPopularMethod();
    super.onInit();
  }

  void callPopularMethod() async{
    try {
      newsLoading.value = true;
      var result = await MockData.services.getPopular();
      if(result != null)
        getPopular.value = result;
      else
        MockData.logger.e("data is null");
    } finally {
      newsLoading.value = false;
    }
    update();
  }

}