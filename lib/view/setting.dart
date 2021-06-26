import 'package:flutter/material.dart';
import 'package:newsapp/other/StringConstant.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _Setting createState() => _Setting();
}

class _Setting extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SETTINGS),
      ),
      body: Container(color: Colors.grey.shade200,),
    );
  }

}
