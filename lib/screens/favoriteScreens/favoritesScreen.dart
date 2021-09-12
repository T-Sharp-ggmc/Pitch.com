import 'package:my_camping/screens/favoriteScreens/widgets/favoriteCampingCard.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  static String routeName = "/favorite";

  const FavoritesScreen({Key key}) : super(key: key);
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        ),
        Expanded(
          child: FavoriteCampingCard(),
        ),
      ],
    );
  }
}
