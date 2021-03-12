import 'package:flutter/material.dart';
import '../../utilities/appTheme.dart';
import '../../widgets/customAppBar.dart';

class ServiceTermScreen extends StatefulWidget {
  static String routeName = "/serviceTerm";
  @override
  _ServiceTermScreenState createState() => _ServiceTermScreenState();
}

class _ServiceTermScreenState extends State<ServiceTermScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewCustomAppBar(nameOfPage: "Termini di servizio"),
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