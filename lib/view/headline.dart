import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/other/StringConstant.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';

class HeadLine extends StatefulWidget {
  const HeadLine({Key key}) : super(key: key);

  @override
  _HeadLineState createState() => _HeadLineState();
}

class _HeadLineState extends State<HeadLine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HEAD_LINE),
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
          padding: EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),
          itemBuilder: (context,position){
            return Padding(
                padding: EdgeInsets.only(bottom: 4),
                   child: Card(
                     elevation: 2.6,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         _drawHeader(),
                         _drawTitle(),
                         _drawBody(),
                         _drawFooter(),
                       ],
                     ),
                   ),
            );
          },
        itemCount: 12,
      ),
    );
  }

 Widget _drawHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Row(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
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
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ibrahim Ali",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8,width: 8,),
              Text("Fri, 12 may 2021",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
        Padding(
          padding: const EdgeInsets.only(left: 16,right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.favorite,color: Colors.grey.shade700,),
                onPressed: (){
                  print("button clicked");
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text("22",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
 }

 Widget _drawTitle() {
  return Padding(
    padding: const EdgeInsets.only(right: 16,left: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Ibrahim Ali",
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8,),
        Text("Lorem Ipsum is simply dummy text of.",
          style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8,),
      ],
    ),
  );
 }

 Widget _drawBody() {
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
       ),
     ),
   );
 }

 Widget _drawFooter() {
   return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Row(
         children: [
           FlatButton(onPressed: (){

           },
               child: Text("16 connects",
                 style: TextStyle(
                   color: Colors.deepOrangeAccent,
                   fontSize: 14,
                   fontWeight: FontWeight.w500,
                 ),
               )
           )
         ],
       ),
       Row(
         children: [
           FlatButton(onPressed: (){

           },
               child: Text("share",
                 style: TextStyle(
                   color: Colors.deepOrangeAccent,
                   fontSize: 14,
                   fontWeight: FontWeight.w500,
                 ),
               )
           ),
           FlatButton(onPressed: (){

           },
               child: Text("Open",
                 style: TextStyle(
                   color: Colors.deepOrangeAccent,
                   fontSize: 14,
                   fontWeight: FontWeight.w500,
                 ),
               )
           ),
         ],
       ),
     ],
   );
 }

}
