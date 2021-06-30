import 'package:flutter/material.dart';
import 'package:newsapp/util/StorageManager.dart';

class ThemeBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, Brightness brightness) builder;
  final Brightness defaultBrightness;

  ThemeBuilder({this.builder, this.defaultBrightness});

  @override
  _ThemeBuilderState createState() => _ThemeBuilderState();

  static _ThemeBuilderState of(BuildContext context)
  {
    return context.findAncestorStateOfType<_ThemeBuilderState>();
  }
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  Brightness _brightness;

  @override
  void initState() {
    super.initState();
    // ignore: unrelated_type_equality_checks
    if(StorageManager.getBool("theme") == true) {
      _brightness = Brightness.light;
      print("theme light is true");
    } else {
      _brightness = Brightness.dark;
      print("theme dark is true");
    }
    if(mounted)
      setState(() {

      });
  }

  void changeTheme() {
    setState(() {
      _brightness =
      _brightness == Brightness.dark ? Brightness.light : Brightness.dark;
    });
  }

  Brightness getCurrentTheme()
  {
    return _brightness;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _brightness);
  }
}