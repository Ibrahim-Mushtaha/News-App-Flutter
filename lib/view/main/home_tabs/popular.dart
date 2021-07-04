import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/popularAppController.dart';
import 'package:newsapp/shared_ui/top_stories_item.dart';


class Popular extends StatefulWidget {
  const Popular({Key key}) : super(key: key);

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {

  var controller = Get.put(PopularAppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        return controller.newsLoading.value ?
        Center(
          child: CircularProgressIndicator(),
        ) :
        ListView.builder(
          primary: false,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 2,right: 2,top: 2,bottom: 2),
          itemBuilder: (context,position){
            var item = controller.getPopular.value;
            return Column(
              children: [
                TopStoriesItem(item.articles[position].title,item.articles[position].description,item.articles[position].urlToImage)
              ],
            );
          },
          itemCount: controller.getPopular.value.articles.length,
        );
      }
      ),
    );
  }

}
