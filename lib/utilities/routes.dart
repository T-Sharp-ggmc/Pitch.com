import 'package:my_camping/screens/accountScreens/accountScreen.dart';
import 'package:my_camping/screens/accountScreens/bookingScreen.dart';
import 'package:my_camping/screens/accountScreens/card_screen.dart';
import 'package:my_camping/screens/accountScreens/changepassword.dart';
import 'package:my_camping/screens/accountScreens/editAccountScreen.dart';
import 'package:my_camping/screens/accountScreens/helpDetailsScreen.dart';
import 'package:my_camping/screens/accountScreens/helpScreen.dart';
import 'package:my_camping/screens/accountScreens/inviteFriendScreen.dart';
import 'package:my_camping/screens/accountScreens/pitchInfoScreen.dart';
import 'package:my_camping/screens/accountScreens/privacySettingScreen.dart';
import 'package:my_camping/screens/accountScreens/reviewScreen.dart';
import 'package:my_camping/screens/accountScreens/serviceTermScreen.dart';
import 'package:my_camping/screens/detailScreen/campingDetailScreen.dart';
import 'package:my_camping/screens/favoriteScreens/favoritesScreen.dart';
import 'package:my_camping/screens/homepage/homeScreen.dart';
import 'package:my_camping/screens/authenticate/forgotPassword.dart';
import 'package:my_camping/screens/authenticate/loginScreen.dart';
import 'package:my_camping/screens/authenticate/signUpScreen.dart';
import 'package:my_camping/screens/searchScreens/searchScreen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  AccountScreen.routeName: (context) => AccountScreen(),
  BookingScreen.routeName: (context) => BookingScreen(),
  ChangepasswordScreen.routeName: (context) => ChangepasswordScreen(),
  EditAccountScreen.routeName: (context) => EditAccountScreen(),
  HelpDetailsScreen.routeName: (context) => HelpDetailsScreen(),
  HelpScreen.routeName: (context) => HelpScreen(),
  InviteFriendScreen.routeName: (context) => InviteFriendScreen(),
  CardScreen.routeName: (context) => CardScreen(),
  PitchInfoScreen.routeName: (context) => PitchInfoScreen(),
  PrivacySettingScreen.routeName: (context) => PrivacySettingScreen(),
  ReviewScreen.routeName: (context) => ReviewScreen(),
  ServiceTermScreen.routeName: (context) => ServiceTermScreen(),
  CampingDetailScreen.routeName: (context) => CampingDetailScreen(),
  FavoritesScreen.routeName: (context) => FavoritesScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  //FiltersScreen.routeName: (context) => FiltersScreen(),
};
