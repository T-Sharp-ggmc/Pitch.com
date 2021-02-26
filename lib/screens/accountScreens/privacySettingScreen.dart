import 'package:flutter/material.dart';
import '../../appTheme.dart';
import '../../widgets/customAppBar.dart';

class PrivacySettingScreen extends StatefulWidget {
  static String routeName = "/privacySetting";
  @override
  _PrivacySettingScreenState createState() => _PrivacySettingScreenState();
}

class _PrivacySettingScreenState extends State<PrivacySettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewCustomAppBar(nameOfPage: "Impostazioni privacy"),
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
              Expanded()
              ],
          ),
        ),
    );
  }
}