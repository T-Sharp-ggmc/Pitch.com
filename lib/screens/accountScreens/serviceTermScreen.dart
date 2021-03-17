import 'package:flutter/material.dart';
import '../../utilities/appTheme.dart';
import '../../widgets/customAppBar.dart';
import 'package:flutter/services.dart' show rootBundle;

class ServiceTermScreen extends StatefulWidget {
  static String routeName = "/serviceTerm";
  @override
  _ServiceTermScreenState createState() => _ServiceTermScreenState();
}

class _ServiceTermScreenState extends State<ServiceTermScreen> {
  String data = '';
  fetchFileData() async {
    String responseText;
    responseText =
        await rootBundle.loadString('assets/text/TermsOfServices.txt');
    setState(() {
      data = responseText;
    });
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }

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
            Expanded(
              child: Text(data, style: TextStyle(fontSize: 14)),
            )
          ],
        ),
      ),
    );
  }
}
