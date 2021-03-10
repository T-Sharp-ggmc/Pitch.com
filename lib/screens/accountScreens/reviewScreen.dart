import 'package:my_camping/screens/accountScreens/widgets/reviewCard.dart';
import 'package:flutter/material.dart';
import '../../appTheme.dart';
import '../../widgets/customAppBar.dart';

class ReviewScreen extends StatefulWidget {
  static String routeName = "/review";

  const ReviewScreen({Key key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen>
    with TickerProviderStateMixin {
  AnimationController tabAnimationController;
  Widget indexView = Container();
  @override
  void initState() {
    tabAnimationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    indexView = ReviewCard(
      animationController: tabAnimationController,
    );
    tabAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    tabAnimationController.dispose();
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
                child: AnimatedBuilder(
                    animation: tabAnimationController,
                    builder: (BuildContext context, Widget child) {
                      return FadeTransition(
                        opacity: tabAnimationController,
                        child: new Transform(
                          transform: new Matrix4.translationValues(
                              0.0,
                              40 * (1.0 - tabAnimationController.value),
                              0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: ReviewCard(
                                  animationController: tabAnimationController,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
    );
  }
}
