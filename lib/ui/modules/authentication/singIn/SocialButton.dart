import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final IconData socialIcon;
  final Function onPress;
  SocialButton({this.socialIcon, this.onPress});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
        child: GestureDetector(
          onTap: () => onPress(),
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: new Icon(
              this.socialIcon,
              color: Color(0xFF0084ff),
            ),
          ),
        ),
      );
}
