//import 'package:WeCanTry/appTheme.dart';
import 'package:WeCanTry/screens/homeScreen.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import './screens/loginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pitch',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
        });
  }
}
