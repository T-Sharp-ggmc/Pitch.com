import 'package:my_camping/screens/accountScreens/widgets/reviewCard.dart';
import 'package:flutter/material.dart';
import '../../utilities/appTheme.dart';
import '../../widgets/customAppBar.dart';

class ReviewScreen extends StatefulWidget {
  static String routeName = "/review";

  const ReviewScreen({Key key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen>
    with TickerProviderStateMixin {
  Widget indexView = Container();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewCustomAppBar(nameOfPage: "Le tue recensioni"),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ReviewCard(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
