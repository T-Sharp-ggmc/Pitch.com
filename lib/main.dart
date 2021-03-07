import 'package:Pitch/routes.dart';
import 'package:Pitch/screens/wrapper.dart';
import 'package:Pitch/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
            title: 'Pitch',
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
            routes: routes,
            //initialRoute: HomeScreen.routeName,
        )
    );
  }
}
