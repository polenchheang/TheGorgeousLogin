import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_gorgeous_login/style/Colors.dart' as Theme;
import 'package:the_gorgeous_login/ui/modules/authentication/SignIn.dart';
import 'package:the_gorgeous_login/ui/modules/authentication/SignUp.dart';
import 'package:the_gorgeous_login/ui/modules/authentication/SwapBar.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  final minHeight = 775.0;

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;

    return new Scaffold(
      key: _scaffoldKey,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowGlow();
        },
        child: SingleChildScrollView(
          child: Container(
            width: mediaQuerySize.width,
            height: mediaQuerySize.height >= minHeight
                ? mediaQuerySize.height
                : minHeight,
            decoration: _backgroundDecorator,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _backgroundImage,
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: SwapBar(
                    pageController: _pageController,
                    leftColor: left,
                    rightColor: right,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (i) => _onPageChanged(i),
                    children: <Widget>[
                      SignIn(
                        onSubmit: () => showInSnackBar("SignUp button pressed"),
                        onLoginWithFacebook: () =>
                            showInSnackBar("Facebook button pressed"),
                        onLoginWithGoogle: () =>
                            showInSnackBar("Google button pressed"),
                      ),
                      SignUp(
                          onSubmit: () =>
                              showInSnackBar("SignUp button pressed")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final _backgroundImage = Padding(
    padding: EdgeInsets.only(top: 75.0),
    child: new Image(
        width: 250.0,
        height: 191.0,
        fit: BoxFit.fill,
        image: new AssetImage('assets/img/login_logo.png')),
  );

  final _backgroundDecorator = new BoxDecoration(
    gradient: new LinearGradient(
        colors: [
          Theme.Colors.loginGradientStart,
          Theme.Colors.loginGradientEnd
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 1.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  );

  _onPageChanged(i) {
    if (i == 0) {
      setState(() {
        right = Colors.white;
        left = Colors.black;
      });
    } else if (i == 1) {
      setState(() {
        right = Colors.black;
        left = Colors.white;
      });
    }
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }

  final separator = Container(
    width: 250.0,
    height: 1.0,
    color: Colors.grey[400],
  );
}
