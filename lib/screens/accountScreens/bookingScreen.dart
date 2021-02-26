import 'package:flutter/material.dart';
import '../../appTheme.dart';
import '../../widgets/customAppBar.dart';

class BookingScreen extends StatefulWidget {
  static String routeName = "/booking";
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: NewCustomAppBar(nameOfPage: "Le tue prenotazioni"),
        backgroundColor: AppTheme.getTheme().backgroundColor,
        body: 
        InkWell(
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