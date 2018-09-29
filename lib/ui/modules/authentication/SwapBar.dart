import 'package:flutter/material.dart';
import 'package:the_gorgeous_login/utils/bubble_indication_painter.dart';

class SwapBar extends StatefulWidget {
  final pageController;
  final leftColor;
  final rightColor;

  SwapBar({this.pageController, this.rightColor, this.leftColor});

  @override
  _SwapBarState createState() => _SwapBarState();
}

class _SwapBarState extends State<SwapBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: widget.pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton(
                label: "Existing",
                onPress: _onSignInButtonPress,
                color: widget.leftColor),
            _buildButton(
                label: "New",
                onPress: _onSignUpButtonPress,
                color: widget.rightColor),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({String label, Function onPress, Color color}) =>
      Expanded(
        child: FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: onPress,
          child: Text(
            label,
            style: TextStyle(
                color: color, fontSize: 16.0, fontFamily: "WorkSansSemiBold"),
          ),
        ),
      );

  void _onSignInButtonPress() {
    widget.pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    widget.pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
