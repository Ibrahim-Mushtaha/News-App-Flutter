import 'package:flutter/material.dart';
import 'package:newsapp/other/StringConstant.dart';
import 'package:newsapp/util/MockData.dart';
import 'package:newsapp/util/StorageManager.dart';
import 'package:newsapp/util/ThemeBuilder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  String dropdownValue = 'On';

  bool isSwitched = false;

  List <String> spinnerItems = [
    'On',
    'Off'
  ];

  @override
  void initState() {
    super.initState();
    if(getSwitchStatus(StorageManager.getBool("theme"))){
      dropdownValue = "On";
    }else{
      dropdownValue = "Off";
    }
  }

  bool getSwitchStatus(bool value) {
    // ignore: unrelated_type_equality_checks
    isSwitched = value != null &&
        value == true ? true : false;
    return isSwitched;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.all(16),
        child: Container(
          width: 360,
          child: Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all()),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  value: dropdownValue,
                  items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) async {
                      dropdownValue = value;
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      if (dropdownValue == "On") {
                        ThemeBuilder.of(context).changeTheme();
                        isSwitched = true;
                        prefs.setBool(THEME, isSwitched);
                        print('Switch Button is ON');
                      } else {
                        isSwitched = false;
                        prefs.setBool(THEME, isSwitched);
                        print('Switch Button is OFF');
                        ThemeBuilder.of(context).changeTheme();
                      }
                      MockData.logger.v("eee select mode $value");

                  }
                  ),
            ),
          ),
        ),
      ),
    );
  }


}
