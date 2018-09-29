import 'package:flutter/material.dart';
import 'package:the_gorgeous_login/utils/bubble_indication_painter.dart';
import 'package:the_gorgeous_login/utils/localize/Localize.dart';

class SwapBar extends StatefulWidget {
  final pageController;
  final leftColor;
  final rightColor;

  SwapBar({this.pageController, this.rightColor, this.leftColor});

  @override
  _SwapBarState createState() => _SwapBarState();
}

class _SwapBarState extends State<SwapBar> {
  Localize _localize;

  @override
  Widget build(BuildContext context) {
    _localize = Localize.of(context);

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
                label: _localize.trans("existingLabel"),
                onPress: _onSignInButtonPress,
                color: widget.leftColor),
            _buildButton(
                label: _localize.trans("newLabel"),
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
