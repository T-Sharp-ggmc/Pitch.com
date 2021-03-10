import 'package:my_camping/screens/authenticate/loginScreen.dart';
import 'package:my_camping/screens/authenticate/signUpScreen.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showLogin = false;
  void toggleView(){
    //print(showSignIn.toString());
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginScreen(toggleView:  toggleView);
    } else {
      return SignUpScreen(toggleView:  toggleView);
    }
  }
}