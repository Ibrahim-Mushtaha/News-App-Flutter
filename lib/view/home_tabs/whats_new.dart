import 'package:flutter/material.dart';
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

    TextStyle _headerTitle = TextStyle(
      color: Colors.white,
      fontSize: 20
    );

    TextStyle _headerDescription = TextStyle(
        color: Colors.white,
        fontSize: 18
    );

    return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(image2),
              fit: BoxFit.cover
            ),
          ),
          child: Center(
            child: Container(
              color: Colors.black45.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    child: Text("How Terriers & Royals Gatecrashed Final",style: _headerTitle,textAlign: TextAlign.center,),
                    padding: EdgeInsets.only(left: 16,right: 16),
                  ),
                  SizedBox(height: 16,),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: _headerDescription,textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        );
  }

  Widget _drawTopStories(BuildContext context) {

    TextStyle _titleStyle = TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w600,
        fontSize: 16
    );

    return Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16,top: 24,bottom: 4),
                child: Text(TOPSTORIES,
                  textAlign: TextAlign.left,
                  style: _titleStyle,
                ),
              ),
              _drawSingleStoriesItem(),
              _drawSingleStoriesItem(),
              _drawSingleStoriesItem(),
              Padding(
                padding: EdgeInsets.only(left: 16,top: 24,bottom: 4),
                child: Text("Recent Updates",
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
    return Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 2),
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
                            child: Image(image: ExactAssetImage(image1),fit: BoxFit.cover,),
                          ),
                          SizedBox(width: 16,),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8,bottom: 8),
                                  child: Text("Lorem Ipsum is simply dummy text of.",maxLines: 2,
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
                                      Text("Lorem Ipsum",),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 16),
                                        child: Row(
                                          children: [
                                            Container(child: Icon(Icons.timer),margin: EdgeInsets.only(right: 4),),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 6),
                                              child: Text("16 min",textAlign: TextAlign.center,),
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
            );
  }

  Widget _drawSingleRecentUpdateItem() {
    return Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 2),
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
                            child: Image(image: ExactAssetImage(image1),fit: BoxFit.cover,),
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
                                child: Text("item 1",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300
                                ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8,bottom: 8,left: 12,top: 8),
                            child: Text("Lorem Ipsum is simply dummy text of.",maxLines: 2,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8,bottom: 8,left: 8,top: 2),
                            child: Row(
                              children: [
                                Container(child: Icon(Icons.timer),margin: EdgeInsets.only(right: 4),),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text("16 min",textAlign: TextAlign.center,),
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
            );
  }

}
