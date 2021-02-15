
import 'package:WeCanTry/widgets/reviewCard.dart';
import 'package:flutter/material.dart';
import '../../appTheme.dart';
import '../../widgets/customAppBar.dart';

class ReviewScreen extends StatefulWidget {
  final AnimationController animationController;

  const ReviewScreen({Key key, this.animationController}) : super(key: key);
  
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> with TickerProviderStateMixin{
   AnimationController tabAnimationController;
  Widget indexView = Container();
   @override
  void initState() {
    tabAnimationController = AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    indexView = ReviewCard(
      animationController: tabAnimationController,
    );
    tabAnimationController.forward();
    widget.animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    tabAnimationController.dispose();
    super.dispose();
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
              Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: CustomAppBar(nameOfPage: "Le tue recensioni"),
              ),
              Expanded(
                child: AnimatedBuilder(
                  animation: widget.animationController,
                  builder: (BuildContext context, Widget child) {
                    return FadeTransition(
                      opacity: widget.animationController,
                      child: new Transform(
                        transform: new Matrix4.translationValues(0.0, 40 * (1.0 - widget.animationController.value), 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child:ReviewCard(
                                animationController: tabAnimationController,
                              ),
                            ) 
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}