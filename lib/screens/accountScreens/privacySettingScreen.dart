import 'package:my_camping/models/privacySelectionList.dart';
import 'package:my_camping/utilities/sizeConfig.dart';
import 'package:flutter/material.dart';
import '../../utilities/appTheme.dart';
import '../../widgets/customAppBar.dart';
import 'widgets/cookie.dart';

class PrivacySettingScreen extends StatefulWidget {
  static String routeName = "/privacySetting";
  @override
  _PrivacySettingScreenState createState() => _PrivacySettingScreenState();
}

class _PrivacySettingScreenState extends State<PrivacySettingScreen> {
  List<PrivacySelectionListData> privacyList =
      PrivacySelectionListData.privacySearchList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewCustomAppBar(nameOfPage: "Impostazioni sulla privacy"),
      backgroundColor: AppTheme.getTheme().backgroundColor,
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 16, bottom: 8),
              child: Container(
                  height: getProportionateScreenHeight(20),
                  child: Text(
                    "Seleziona quali cookie vuoi accettare sull'app",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )),
            ),
            Divider(
              color: AppTheme.getTheme().dividerColor,
              height: 2,
            ),
            Expanded(
                child: Stack(children: <Widget>[
              Container(
                child: ListView.builder(
                  itemCount: privacyList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Cookie(data: privacyList[index]);
                  },
                ),
              )
            ])),
          ],
        ),
      ),
    );
  }
}