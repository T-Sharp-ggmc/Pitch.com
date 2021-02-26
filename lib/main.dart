import 'package:Pitch/routes.dart';
import 'package:Pitch/screens/homepage/homeScreen.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'screens/login/loginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pitch',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        initialRoute: HomeScreen.routeName,
        routes: routes,
    );
  }
}
