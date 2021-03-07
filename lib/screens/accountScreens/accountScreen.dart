import 'package:Pitch/models/profileSelectionList.dart';
import 'package:Pitch/screens/accountScreens/card_screen.dart';
import 'package:Pitch/screens/accountScreens/editAccountScreen.dart';
import 'package:Pitch/services/auth.dart';
import 'package:Pitch/sizeConfig.dart';
import 'package:flutter/material.dart';
import '../../appTheme.dart';
import 'changepassword.dart';
import 'helpScreen.dart';
import 'inviteFriendScreen.dart';
import 'bookingScreen.dart';
import 'pitchInfoScreen.dart';
import 'privacySettingScreen.dart';
import 'reviewScreen.dart';
import 'serviceTermScreen.dart';

class AccountScreen extends StatefulWidget {
  static String routeName = "/account";
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with TickerProviderStateMixin {
  List<SettingsListData> userSettingsList = SettingsListData.userSettingsList;
  AnimationController controller;
  AuthService _authService = AuthService();

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    controller.forward(); //implementare animazione nel build
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppTheme.getTheme().backgroundColor,
        body: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: getProportionateScreenHeight(60),
              ),
              getProfileOption(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 20, top: 16),
                child: Center(
                  child: Container(
                    height: getProportionateScreenHeight(50),
                    width: getProportionateScreenWidth(150),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppTheme.getTheme().errorColor),
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: AppTheme.getTheme().errorColor,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        highlightColor: Colors.transparent,
                        onTap: () async{
                          await _authService.signOut();
                        },
                        child: Center(
                          child: Text(
                            "Esci",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getProfileOption() {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 10),
        itemCount: userSettingsList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (index == 0)
                Navigator.pushNamed(context, EditAccountScreen.routeName);
              if (index == 1)
                Navigator.pushNamed(context, ChangepasswordScreen.routeName);
              if (index == 2)
                Navigator.pushNamed(context, CardScreen.routeName);
              if (index == 3)
                Navigator.pushNamed(context, ReviewScreen.routeName);
              if (index == 4)
                Navigator.pushNamed(context, HelpScreen.routeName);
              if (index == 5)
                Navigator.pushNamed(context, InviteFriendScreen.routeName);
              if (index == 6)
                Navigator.pushNamed(context, BookingScreen.routeName);
              if (index == 7)
                Navigator.pushNamed(context, ServiceTermScreen.routeName);
              if (index == 8)
                Navigator.pushNamed(context, PrivacySettingScreen.routeName);
              if (index == 9)
                Navigator.pushNamed(context, PitchInfoScreen.routeName);
            },
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            userSettingsList[index].titleTxt,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          child: Icon(userSettingsList[index].iconData,
                              color: AppTheme.getTheme()
                                  .disabledColor
                                  .withOpacity(0.3)),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Divider(
                    height: 1,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
