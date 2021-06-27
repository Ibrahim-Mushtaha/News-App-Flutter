import 'package:flutter/material.dart';
import 'package:newsapp/other/StringConstant.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _Setting createState() => _Setting();
}

class _Setting extends State<Setting> {

  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SETTINGS),
      ),
      body: Container(
          color: Colors.grey.shade200,
          child: Center(
            child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(textValue),
                Switch(value: isSwitched, onChanged: toggleSwitch),
              ],
            ),
            ),
          )
      ),
    );
  }

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }


}
