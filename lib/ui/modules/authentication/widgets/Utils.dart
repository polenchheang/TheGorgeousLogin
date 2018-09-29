import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Utils {
  static final separator = Container(
    width: 250.0,
    height: 1.0,
    color: Colors.grey[400],
  );

  static final cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  );

  static obscureTrailingIcon({onTap}) => GestureDetector(
      onTap: () => onTap(),
      child: Icon(
        FontAwesomeIcons.eye,
        size: 15.0,
        color: Colors.black,
      ));
}
