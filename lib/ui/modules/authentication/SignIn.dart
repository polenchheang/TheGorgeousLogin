import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_gorgeous_login/app_lib.dart' as App;
import 'package:the_gorgeous_login/ui/modules/authentication/singIn/SocialButton.dart';
import 'package:the_gorgeous_login/ui/modules/authentication/widgets/Button.dart';
import 'package:the_gorgeous_login/ui/modules/authentication/widgets/Utils.dart';

class SignIn extends StatefulWidget {
  final Function onSubmit;
  final Function onLoginWithGoogle;
  final Function onLoginWithFacebook;

  SignIn({this.onSubmit, this.onLoginWithGoogle, this.onLoginWithFacebook});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _obscureTextLogin = true;

  @override
  Widget build(BuildContext context) {
    return _moduleContainer(Column(
      children: <Widget>[
        _loginContainer(Column(
          children: <Widget>[
            App.TextField(
              focusNode: myFocusNodeEmailLogin,
              controller: loginEmailController,
              hintText: "Email Address",
              iconData: FontAwesomeIcons.envelope,
              keyboardType: TextInputType.emailAddress,
            ),
            Utils.separator,
            App.TextField(
                focusNode: myFocusNodePasswordLogin,
                controller: loginPasswordController,
                hintText: "Password",
                iconData: FontAwesomeIcons.lock,
                obscureText: _obscureTextLogin,
                suffixIcon: Utils.obscureTrailingIcon(onTap: _toggleLogin)),
            Button("LOGIN", () => widget.onSubmit()),
          ],
        )),
        _forgetPassword,
        _orSeparator(),
        _socialsLogin(),
      ],
    ));
  }

  _moduleContainer(moduleContent) => ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Container(
          padding: EdgeInsets.only(top: 23.0),
          child: moduleContent,
        ),
      );

  _loginContainer(loginForm) => Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Card(
            elevation: 2.0,
            color: Colors.white,
            shape: Utils.cardShape,
            child: Container(
              width: 300.0,
              height: 235.0,
              child: loginForm,
            ),
          ),
        ],
      );

  _orSeparator() => Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _strideSeparator(left: Colors.white10, right: Colors.white),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Text(
                "Or",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: "WorkSansMedium"),
              ),
            ),
            _strideSeparator(left: Colors.white, right: Colors.white10),
          ],
        ),
      );

  _strideSeparator({Color left, Color right}) => Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                left,
                right,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        width: 100.0,
        height: 1.0,
      );

  _socialsLogin() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SocialButton(
            socialIcon: FontAwesomeIcons.facebookF,
            onPress: () => widget.onLoginWithFacebook(),
          ),
          SocialButton(
            socialIcon: FontAwesomeIcons.google,
            onPress: () => widget.onLoginWithGoogle(),
          ),
        ],
      );

  final _forgetPassword = Padding(
    padding: EdgeInsets.only(top: 10.0),
    child: FlatButton(
        onPressed: () {},
        child: Text(
          "Forgot Password?",
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: "WorkSansMedium"),
        )),
  );

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  @override
  void dispose() {
    myFocusNodePasswordLogin.dispose();
    myFocusNodeEmailLogin.dispose();
    super.dispose();
  }
}
