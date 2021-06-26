import 'package:flutter/material.dart';
import 'package:newsapp/other/StringConstant.dart';

class ReadLater extends StatefulWidget {
  const ReadLater({Key key}) : super(key: key);

  @override
  _ReadLater createState() => _ReadLater();
}

class _ReadLater extends State<ReadLater> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(READ_LATER),
      ),
      body: Container(color: Colors.grey.shade200,),
    );
  }

}
