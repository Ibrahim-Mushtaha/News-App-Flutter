
import 'package:get/get.dart';
import 'package:newsapp/model/whatsnew/News.dart';
import 'package:newsapp/service/service.dart';
import 'package:newsapp/util/MockData.dart';

class PopularAppController extends GetxController {

  var getPosts = News().obs;
  var postLoading = true.obs;
  Services services = Services();

  @override
  void onInit() {
    callPostMethod();
    super.onInit();
  }

  void callPostMethod() async{
    try {
      postLoading.value = true;
      var result = await MockData.services.getWhatsNew();
      if(result != null)
        getPosts.value = result;
      else
        MockData.logger.e("data is null");
    } finally {
      postLoading.value = false;
    }
    update();
  }

}