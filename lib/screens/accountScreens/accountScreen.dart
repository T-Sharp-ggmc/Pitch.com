import 'package:WeCanTry/models/profileSelectionList.dart';
import 'package:WeCanTry/screens/accountScreens/editAccountScreen.dart';
import 'package:WeCanTry/widgets/accountImage.dart';
import 'package:flutter/material.dart';

import '../../appTheme.dart';
import 'changepassword.dart';
import 'helpScreen.dart';
import 'inviteFriendScreen.dart';
import 'bookingScreen.dart';
import 'reviewScreen.dart';

class AccountScreen extends StatefulWidget {
  final AnimationController animationController;

  const AccountScreen({Key key, this.animationController}) : super(key: key);
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<SettingsListData> userSettingsList = SettingsListData.userSettingsList;

  @override
  void initState() {
    // widget.animationController.forward(); implementare animazione nel build
    super.initState();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(
                      bottom: 16 + MediaQuery.of(context).padding.bottom),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                AccountImage(),
                                Positioned(
                                  bottom: 8,
                                  child: Text(
                                    "Gina Pollicina",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              getProfileOption(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getProfileOption() {
    return Expanded(
      flex: 2,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 10),
        itemCount: userSettingsList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (index == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditAccountScreen(),
                        fullscreenDialog: true,
                      ));
              }
              if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangepasswordScreen(),
                    fullscreenDialog: true,
                  ),
                );
              }
              if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingScreen(),
                    fullscreenDialog: true,
                  ),
                );
              }
              if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewScreen(
                      animationController: widget.animationController,
                    ),
                    fullscreenDialog: true,
                  ),
                );
              }
              if (index == 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpScreen(),
                    fullscreenDialog: true,
                  ),
                );
              }
              if (index == 5) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InviteFriendScreen(),
                    fullscreenDialog: true,
                  ),
                );
              }
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
