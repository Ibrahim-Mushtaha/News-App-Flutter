import 'package:flutter/material.dart';
import 'package:newsapp/other/ColorsConstant.dart';
import 'package:newsapp/other/StringConstant.dart';
import 'package:newsapp/util/MockData.dart';
import 'package:package_info/package_info.dart';

class AboutApp extends StatefulWidget {

  const AboutApp({Key key}) : super(key: key);

  @override
  _AboutApp createState() => _AboutApp();
}

class _AboutApp extends State<AboutApp> {

  String _version;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(ABOUTAPP),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    width: 100,
                    height: 100,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Center(
                        child:  Image.asset(
                          logo,
                          height: 56,
                          width: 56,
                          fit:  BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("News App",
                    style: TextStyle(
                      color: AppColors.deepBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.only(right: 18,left: 18),
                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: _drawFooter()
            )
          ],
        ),
      ),
    );
  }


  Widget _drawFooter() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: FutureBuilder(
        future: PackageInfo.fromPlatform(),
          builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
          if(snapshot.hasData)
          return Text("version ${snapshot.data.version.toString().toUpperCase()}",
            style: TextStyle(
              color: AppColors.deepBlue,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          );
          return Container();
        }
      ),
    );
  }

}
