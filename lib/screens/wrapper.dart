import 'package:Pitch/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';
import 'homepage/homeScreen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null){
      return Authenticate();
    } else {
      return HomeScreen();
    }
  }
}