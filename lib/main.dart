import 'package:flutter/material.dart';
import 'package:the_gorgeous_login/resources/strings.dart';
import 'package:the_gorgeous_login/style/Theme.dart';
import 'package:the_gorgeous_login/ui/AuthenticationPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      theme: appTheme,
      home: new LoginPage(),
    );
  }
}
