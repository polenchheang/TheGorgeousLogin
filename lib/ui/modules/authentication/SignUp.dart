import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_gorgeous_login/app_lib.dart' as App;
import 'package:the_gorgeous_login/ui/modules/authentication/widgets/Button.dart';
import 'package:the_gorgeous_login/ui/modules/authentication/widgets/Utils.dart';

class SignUp extends StatefulWidget {
  final Function onSubmit;

  SignUp({this.onSubmit});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) => _signUpContainer(Column(
        children: <Widget>[
          App.TextField(
              focusNode: myFocusNodeName,
              controller: signUpNameController,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              iconData: FontAwesomeIcons.user,
              hintText: "Name"),
          Utils.separator,
          App.TextField(
              focusNode: myFocusNodeEmail,
              controller: signUpEmailController,
              keyboardType: TextInputType.emailAddress,
              iconData: FontAwesomeIcons.envelope,
              hintText: "Email Address"),
          Utils.separator,
          App.TextField(
              focusNode: myFocusNodePassword,
              controller: signUpPasswordController,
              hintText: "Password",
              iconData: _obscureLeadingIcon,
              obscureText: _obscureTextSignUp,
              suffixIcon: Utils.obscureTrailingIcon(onTap: _toggleSignUp)),
          Utils.separator,
          App.TextField(
            controller: signUpConfirmPasswordController,
            obscureText: _obscureTextSignUpConfirm,
            hintText: "Confirmation",
            suffixIcon: Utils.obscureTrailingIcon(onTap: _toggleSignUpConfirm),
            iconData: _obscureLeadingIcon,
          ),
          Button("SIGN UP", () => widget.onSubmit()),
        ],
      ));

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpNameController = TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();
  final TextEditingController signUpConfirmPasswordController =
      TextEditingController();

  final _obscureLeadingIcon = FontAwesomeIcons.lock;

  bool _obscureTextSignUp = true;

  bool _obscureTextSignUpConfirm = true;

  _signUpContainer(Widget signUpForm) => ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Container(
          padding: EdgeInsets.only(top: 23.0),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                overflow: Overflow.visible,
                children: <Widget>[
                  Card(
                    elevation: 2.0,
                    color: Colors.white,
                    shape: Utils.cardShape,
                    child: Container(
                      width: 300.0,
                      height: 405.0,
                      child: signUpForm,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  _toggleSignUp() {
    setState(() {
      _obscureTextSignUp = !_obscureTextSignUp;
    });
  }

  _toggleSignUpConfirm() {
    setState(() {
      _obscureTextSignUpConfirm = !_obscureTextSignUpConfirm;
    });
  }

  @override
  dispose() {
    myFocusNodePassword.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodeName.dispose();
    super.dispose();
  }
}
