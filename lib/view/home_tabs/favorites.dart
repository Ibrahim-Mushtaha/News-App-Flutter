import 'package:flutter/material.dart';
import 'package:newsapp/other/StringConstant.dart';


class Favorites extends StatefulWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,position){
        return _drawSingleFavoriteItem();
      },
      itemCount: 20,
    );
  }

  Widget _drawSingleFavoriteItem() {
    return Padding(
      padding: EdgeInsets.only(left: 8,right: 8,top: 2),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x54000000),
                                spreadRadius:0.4,
                                blurRadius: 24,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(image: ExactAssetImage(image1),fit: BoxFit.cover,),
                          ),
                        ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 4,bottom: 8,left: 16,top: 12),
                                child: Text("Ibrahim Mushtaha",maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4,right: 4,left: 16),
                                    child: Text("16 min",textAlign: TextAlign.center,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Transform.translate(
                              child: SizedBox(
                                child: IconButton(
                                  icon: Icon(Icons.bookmark_border),
                                  onPressed: (){
                                    print("button clicked");
                                  },
                                ),
                              ),
                            offset: Offset(140,0),
                          ),
                        ],
                      ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 124,
                                height: 124,
                                child: Image(image: ExactAssetImage(image1),fit: BoxFit.cover,),
                              ),
                              SizedBox(width: 16,),
                              Expanded(
                                child: Column(
                                  children: [
                                    Transform.translate(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 8,bottom: 8),
                                        child: Text("Lorem Ipsum is simply dummy text of.",maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      offset: Offset(0,-16),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Lorem Ipsum",),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: SizedBox(height: 0.6,child: Container(color: Colors.grey.withOpacity(0.2),),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
