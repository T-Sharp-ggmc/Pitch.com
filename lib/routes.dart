import 'package:Pitch/screens/accountScreens/accountScreen.dart';
import 'package:Pitch/screens/accountScreens/bookingScreen.dart';
import 'package:Pitch/screens/accountScreens/changepassword.dart';
import 'package:Pitch/screens/accountScreens/editAccountScreen.dart';
import 'package:Pitch/screens/accountScreens/helpDetailsScreen.dart';
import 'package:Pitch/screens/accountScreens/helpScreen.dart';
import 'package:Pitch/screens/accountScreens/inviteFriendScreen.dart';
import 'package:Pitch/screens/accountScreens/paymentMethodScreen.dart';
import 'package:Pitch/screens/accountScreens/pitchInfoScreen.dart';
import 'package:Pitch/screens/accountScreens/privacySettingScreen.dart';
import 'package:Pitch/screens/accountScreens/reviewScreen.dart';
import 'package:Pitch/screens/accountScreens/serviceTermScreen.dart';
import 'package:Pitch/screens/detailScreen/campingDetailScreen.dart';
import 'package:Pitch/screens/favoriteScreens/favoritesScreen.dart';
import 'package:Pitch/screens/homepage/homeScreen.dart';
import 'package:Pitch/screens/login/forgotPassword.dart';
import 'package:Pitch/screens/login/loginScreen.dart';
import 'package:Pitch/screens/login/signUpScreen.dart';
import 'package:Pitch/screens/searchScreens/filtersScreen.dart';
import 'package:Pitch/screens/searchScreens/searchScreen.dart';
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
  PaymentMethodScreen.routeName: (context) => PaymentMethodScreen(),
  PitchInfoScreen.routeName: (context) => PitchInfoScreen(),
  PrivacySettingScreen.routeName: (context) => PrivacySettingScreen(),
  ReviewScreen.routeName: (context) => ReviewScreen(),
  ServiceTermScreen.routeName: (context) => ServiceTermScreen(),
  CampingDetailScreen.routeName: (context) => CampingDetailScreen(),
  FavoritesScreen.routeName: (context) => FavoritesScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  //FiltersScreen.routeName: (context) => FiltersScreen(),
};