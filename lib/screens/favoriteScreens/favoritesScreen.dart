import 'package:my_camping/screens/favoriteScreens/widgets/favoriteCampingCard.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  static String routeName = "/favorite";
  final AnimationController animationController;

  const FavoritesScreen({Key key, this.animationController}) : super(key: key);
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with TickerProviderStateMixin {
  AnimationController tabAnimationController;
  Widget indexView = Container();

  @override
  void initState() {
    tabAnimationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    //per evitare che la prima volta che apre la pagina si veda sfocato
    indexView = FavoriteCampingCard(
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
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.animationController,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 40 * (1.0 - widget.animationController.value), 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                ),
                Expanded(
                  child: FavoriteCampingCard(
                    animationController: tabAnimationController,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
