import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:newsapp/other/StringConstant.dart';

class WhatsNew extends StatefulWidget {
  const WhatsNew({Key key}) : super(key: key);

  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _drawHeader(context),
          _drawTopStories(context),
        ],
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
            children: [
              Padding(
                child: Text(
                  "How Terriers & Royals Gatecrashed Final",
                  style: _headerTitle,
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
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
              TOPSTORIES,
              textAlign: TextAlign.left,
              style: _titleStyle,
            ),
          ),
          _drawSingleStoriesItem(),
          _drawSingleStoriesItem(),
          _drawSingleStoriesItem(),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 24, bottom: 4),
            child: Text(
              "Recent Updates",
              textAlign: TextAlign.left,
              style: _titleStyle,
            ),
          ),
          _drawSingleRecentUpdateItem(),
          _drawSingleRecentUpdateItem(),
          _drawSingleRecentUpdateItem(),
          _drawSingleRecentUpdateItem(),
        ],
      ),
    );
  }

  //todo create card with image and title & etc...
  Widget _drawSingleStoriesItem() {
    return InkWell(
      onTap: () {
        MotionToast.success(
          title: "item Stories is clicked",
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          description: "Example of success motion toast",
          descriptionStyle: TextStyle(fontSize: 12, color: Colors.white),
          width: 300,
        ).show(context);
        print("item Stories is clicked");
      },
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 2),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image(
                        image: ExactAssetImage(image1),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8, bottom: 8),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of.",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Lorem Ipsum",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Icon(Icons.timer),
                                        margin: EdgeInsets.only(right: 4),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: Text(
                                          "16 min",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //todo create recent update item
  Widget _drawSingleRecentUpdateItem() {
    return InkWell(
      onTap: () {
        _showSheet();
        print("item is clicked");
      },
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 2),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image(
                        image: ExactAssetImage(image1),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 94,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            "item 1",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8, bottom: 8, left: 12, top: 8),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of.",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8, bottom: 8, left: 8, top: 2),
                      child: Row(
                        children: [
                          Container(
                            child: Icon(Icons.timer),
                            margin: EdgeInsets.only(right: 4),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              "16 min",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
