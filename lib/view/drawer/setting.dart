import 'package:flutter/material.dart';
import 'package:newsapp/other/StringConstant.dart';
import 'package:newsapp/widgets/DropDown.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _Setting createState() => _Setting();

}

class _Setting extends State<Setting> {

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SETTINGS),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16,top: 24,right: 16),
            child: Text("Night mode",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child:
            DropDown(),
          ),
        ],
      ),
    );
  }

}
