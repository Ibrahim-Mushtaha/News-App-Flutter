import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/headlineAppController.dart';
import 'package:newsapp/other/StringConstant.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';

class HeadLine extends StatefulWidget {
  const HeadLine({Key key}) : super(key: key);

  @override
  _HeadLineState createState() => _HeadLineState();
}

class _HeadLineState extends State<HeadLine> {

  var controller = Get.put(HeadLineAppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HEAD_LINE),
      ),
      drawer: NavigationDrawer(),
      body: Obx((){
        return controller.postLoading.value ?
        Center(
          child: CircularProgressIndicator(),
        ) :
        ListView.builder(
          primary: false,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 2,right: 2,top: 2,bottom: 2),
          itemBuilder: (context,position){
            var item = controller.getHeadLine.value;
            return Padding(
              padding: EdgeInsets.all(4),
              child:  Card(
                elevation: 4,
                child: Column(
                  children: [
                    _drawHeader(item.articles[position].author,item.articles[position].publishedAt.toString()),
                    _drawBody(item.articles[position].title,item.articles[position].description,item.articles[position].urlToImage),
                  ],
                ),
              ),
            );
          },
          itemCount: controller.getHeadLine.value.articles.length,
        );
      }
      ),
    );
  }

 Widget _drawHeader(String name,String publishAt) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16,left: 16,right: 16,bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name ?? "Ibrahim Ali",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8,width: 8,),
                Text(publishAt ?? "Fri, 12 may 2021",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
        /* todo add icon save in right
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
        ),*/
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

 Widget _drawBody(String title, String description,String image) {
   return InkWell(
     onTap: () {
       print("item Stories is clicked");
     },
     child: Padding(
       padding: EdgeInsets.only(left: 4, right: 4, top: 2,bottom: 8),
       child: Padding(
         padding: const EdgeInsets.all(4),
         child: Column(
           children: [
             Row(
               children: [
                 SizedBox(
                   width: 108,
                   height: 108,
                   child: Image.network( image ?? "",fit: BoxFit.cover,)
                 ),
                 SizedBox(
                   width: 16,
                 ),
                 Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(right: 4, bottom: 8),
                         child: Text(
                            title ?? 'Lorem Ipsum',
                           maxLines: 2,
                           style: TextStyle(
                             fontSize: 16,
                             fontWeight: FontWeight.w600,
                           ),
                           textAlign: TextAlign.start,
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(right: 4),
                         child: Text(
                         description ?? "Lorem Ipsum",
                           style: TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.w300,
                           ),
                         textAlign: TextAlign.start,
                           maxLines: 2,
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
