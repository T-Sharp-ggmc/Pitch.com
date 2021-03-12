import 'package:flutter/material.dart';
import '../../utilities/appTheme.dart';
import '../../widgets/customAppBar.dart';

class PitchInfoScreen extends StatefulWidget {
  static String routeName = "/pitchInfo";
  @override
  _PitchInfoScreenState createState() => _PitchInfoScreenState();
}

class _PitchInfoScreenState extends State<PitchInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewCustomAppBar(nameOfPage: "Informazioni su Pitch"),
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
              //Expanded()
              ],
          ),
        ),
    );
  }
}