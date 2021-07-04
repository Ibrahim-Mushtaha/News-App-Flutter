import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:newsapp/controller/whatsnewappcontroller.dart';
import 'package:newsapp/other/StringConstant.dart';
import 'package:newsapp/shared_ui/recent_update_item.dart';

class WhatsNew extends StatefulWidget {
  const WhatsNew({Key key}) : super(key: key);

  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {

  var controller = Get.put(WhatsNewAppController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _drawHeader(context),
            _drawTopStories(context),
          ],
        ),
      ),
    );
  }

  Widget _drawHeader(BuildContext context) {
    TextStyle _headerTitle = TextStyle(color: Colors.white, fontSize: 20);

    TextStyle _headerDescription = TextStyle(color: Colors.white, fontSize: 18);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        image:
            DecorationImage(image: ExactAssetImage(image2), fit: BoxFit.cover),
      ),
      child: Center(
        child: Container(
          color: Colors.black45.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Padding(
              child: Text(
                "How Terriers & Royals Gatecrashed Final",
                style: _headerTitle,
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.only(left: 16, right: 16),
            )
              ,
              SizedBox(
                height: 16,
              ),
              Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: _headerDescription,
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawTopStories(BuildContext context) {
    TextStyle _titleStyle = TextStyle(
        color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 16);

    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, top: 24, bottom: 4),
            child: Text(
              "Recent Updates",
              textAlign: TextAlign.left,
              style: _titleStyle,
            ),
          ),
          Obx((){
            return controller.postLoading.value ?
            Center(
              child: CircularProgressIndicator(),
            ) :
            ListView.builder(
              primary: false,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 4,right: 4,top: 4,bottom: 4),
              itemBuilder: (context,position){
                var item = controller.whatsNewObs.value.articles[position];
                return Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child:  RecentUpdateItem(item.title,item.description,item.author,item.urlToImage),
                );
              },
              itemCount: controller.whatsNewObs.value.articles.length,
            );
          }
          ),
        ],
      ),
    );
  }


  void _showSheet() {
    showFlexibleBottomSheet<void>(
      minHeight: 160,
      initHeight: 0.5,
      maxHeight: 1,
      context: context,
      builder: _buildBottomSheet,
      anchors: [0, 0.5, 1],
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return SafeArea(
      child: Material(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                //todo create bottom sheet header using title & close btn
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 12, left: 12, bottom: 8, top: 16),
                        child: Text(
                        "Details Dialog",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.black54,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 40.0,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    //todo add close btn
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: (){
                        print("clicked");
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 12, right: 12,top: 4),
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x54000000),
                              spreadRadius: 0.4,
                              blurRadius: 24,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Center(
                              child: Container(
                            color: Colors.deepOrangeAccent,
                            child: IconButton(
                              icon: Icon(Icons.close,
                                color: Colors.white,
                                size: 18,
                              ),
                              padding: EdgeInsets.all(4),
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                //todo make the line below the bottom sheet title
                Transform.translate(
                  offset: Offset(0,-8),
                  child: Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 60,
                        height: 8,
                        child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.deepOrangeAccent,
                        ),
                        ),
                      ),
                    ),
                  ),
                ),
                //todo bottom sheet body below the header
                Container(
                  margin: EdgeInsets.only(top: 18,left: 16,right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                       width: 360,
                        child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.black54,
                            wordSpacing: 2,
                          ),
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
