import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as MaterialTextField;

class TextField extends StatelessWidget {
  final focusNode;
  final controller;
  final hintText;
  final IconData iconData;
  final keyboardType;
  final obscureText;
  final suffixIcon;
  final textCapitalization;

  TextField(
      {this.focusNode,
      this.controller,
      this.hintText,
      this.iconData,
      this.keyboardType,
      this.obscureText = false,
      this.suffixIcon,
      this.textCapitalization = TextCapitalization.none})
      : assert(controller != null),
        assert(hintText != null),
        assert(iconData != null);

  @override
  Widget build(BuildContext context) => Padding(
        padding: _padding,
        child: MaterialTextField.TextField(
          focusNode: focusNode,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          style: _textStyle,
          decoration: _decorInput(iconData),
        ),
      );

  InputDecoration _decorInput(IconData iconData) => InputDecoration(
      border: InputBorder.none,
      icon: _icon(iconData),
      hintText: hintText,
      hintStyle: _hintTextStyle,
      suffixIcon: suffixIcon);

  Widget _icon(IconData iconData) => Icon(
        iconData,
        color: Colors.black,
        size: 22.0,
      );

  final _padding =
      EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0, right: 25.0);

  final _textStyle = TextStyle(
      fontFamily: "WorkSansSemiBold", fontSize: 16.0, color: Colors.black);
  final _hintTextStyle =
      TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 17.0);
}
