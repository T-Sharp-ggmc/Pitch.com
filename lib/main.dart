//import 'package:WeCanTry/appTheme.dart';
import 'package:WeCanTry/appTheme.dart';
import 'package:WeCanTry/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/loginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp( 
        debugShowCheckedModeBanner: false,
        title: 'Pitch', 
        theme: AppTheme.getTheme(),
        home: HomeScreen(), 
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
      }),
    );
  }
}
