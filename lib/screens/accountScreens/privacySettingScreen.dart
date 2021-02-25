import 'package:flutter/material.dart';
import '../../widgets/customAppBar.dart';

class PrivacySettingScreen extends StatefulWidget {
  @override
  _PrivacySettingScreenState createState() => _PrivacySettingScreenState();
}

class _PrivacySettingScreenState extends State<PrivacySettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // backgroundColor: AppTheme.getTheme().backgroundColor,
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
              Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: CustomAppBar(nameOfPage: "Le mie prenotazioni"),
              ),
              Expanded()
              ],
          ),
        ),
      ),
    );
  }
}