import 'package:flutter/material.dart';
import 'package:newsapp/other/StringConstant.dart';


class Popular extends StatefulWidget {
  const Popular({Key key}) : super(key: key);

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context,position){
          return _drawSingleStoriesItem();
        },
        itemCount: 20,
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
}
