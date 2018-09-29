import 'package:flutter/material.dart';
import 'package:the_gorgeous_login/style/Colors.dart' as Theme;

class Button extends StatelessWidget {
  final String label;
  final Function onPress;

  Button([this.label, this.onPress]);

  Widget _content() => Text(
        label,
        style: _textStyle,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: _decorateBox,
        child: MaterialButton(
            highlightColor: Colors.transparent,
            splashColor: Theme.Colors.loginGradientEnd,
            child: Padding(
              padding: _padding,
              child: _content(),
            ),
            onPressed: () => onPress()));
  }

  final _decorateBox = new BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    gradient: new LinearGradient(
        colors: [
          Theme.Colors.loginGradientEnd,
          Theme.Colors.loginGradientStart
        ],
        begin: const FractionalOffset(0.2, 0.2),
        end: const FractionalOffset(1.0, 1.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  );

  final _padding = const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0);

  final _textStyle = TextStyle(
      color: Colors.white, fontSize: 25.0, fontFamily: "WorkSansBold");
}
