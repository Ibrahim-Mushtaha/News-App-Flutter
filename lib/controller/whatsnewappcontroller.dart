
import 'package:get/get.dart';
import 'package:newsapp/model/whatsnew/News.dart';
import 'package:newsapp/service/service.dart';
import 'package:newsapp/util/MockData.dart';

class WhatsNewAppController extends GetxController {

  var whatsNewObs = News().obs;
  var postLoading = true.obs;

  @override
  void onInit() {
    getWhatsNew();
    super.onInit();
  }

  void getWhatsNew() async{
    try {
      postLoading.value = true;
      var result = await MockData.services.getWhatsNew();
      if(result != null) {
        MockData.logger.e("data is $result");
        whatsNewObs.value = result;
      }else
        MockData.logger.e("data is null");
    } finally {
      postLoading.value = false;
    }
    update();
  }

}