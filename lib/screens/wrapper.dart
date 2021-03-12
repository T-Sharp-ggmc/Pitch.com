import 'package:my_camping/models/user.dart';
import 'package:my_camping/provider/campingProvider.dart';
import 'package:my_camping/provider/favoriteCampingProvider.dart';
import 'package:my_camping/provider/premiumCampingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';
import 'homepage/homeScreen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyCampingUser>(context);
    Provider.of<CampingProvider>(context).loadCamping();
    Provider.of<PremiumCampingProvider>(context).loadPremiumCamping();
    Provider.of<FavoriteCampingProvider>(context).loadfavoriteCamping();
    //print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen();
    }
  }
}
