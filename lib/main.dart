import 'package:my_camping/provider.dart';
import 'package:my_camping/routes.dart';
import 'package:my_camping/screens/wrapper.dart';
import 'package:my_camping/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyCampingUser>.value(
        value: AuthService().user,
        initialData: null,
        child: MultiProvider(
          providers: appProvider,
          child: MaterialApp(
            title: 'Pitch',
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
            routes: routes,
            //initialRoute: HomeScreen.routeName,
          ),
        ));
  }
}
