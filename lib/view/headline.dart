import 'package:flutter/material.dart';
import 'package:newsapp/other/StringConstant.dart';

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
      body: Container(color: Colors.grey.shade200,),
    );
  }

}
