import 'package:flutter/material.dart';
import 'package:newsapp/other/StringConstant.dart';
import 'package:newsapp/shared_ui/top_stories_item.dart';


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
          return TopStoriesItem("Lorem Ipsum is simply dummy text of.");
        },
        itemCount: 20,
    );
  }

}
