import 'package:flutter/material.dart';
import 'package:newsapp/other/StringConstant.dart';
import 'package:newsapp/util/MockData.dart';
import 'package:newsapp/util/StorageManager.dart';
import 'package:newsapp/util/ThemeBuilder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _Setting createState() => _Setting();
}

class _Setting extends State<Setting> {

  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  @override
  void initState(){
    super.initState();
    getSwitchStatus(StorageManager.getBool("theme"));
  }

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

  void toggleSwitch(bool value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isSwitched == false) {
      setState(() {
        ThemeBuilder.of(context).changeTheme();
        isSwitched = true;
        prefs.setBool("theme", isSwitched);
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else {
      setState(() {
        ThemeBuilder.of(context).changeTheme();
        isSwitched = false;
        prefs.setBool("theme", isSwitched);
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
    MockData.logger.e("eee theme ${prefs.getBool("theme")}", );
  }

    bool getSwitchStatus(bool value) {
    // ignore: unrelated_type_equality_checks
    isSwitched = value != null &&
        value == true ? true : false;
    return isSwitched;
  }

}
