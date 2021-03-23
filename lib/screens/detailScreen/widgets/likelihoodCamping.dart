import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_camping/provider/campingProvider.dart';
import 'package:my_camping/screens/favoriteScreens/widgets/favoriteCampingCard.dart';
import 'package:my_camping/utilities/appTheme.dart';
import 'package:my_camping/widgets/loading.dart';
import 'package:provider/provider.dart';

class LikelihoodCamping extends StatefulWidget {
  final String cid;
  final String campingCity;
  final List<String> campingPitchCategories;

  const LikelihoodCamping(
      {Key key, this.campingCity, this.campingPitchCategories, this.cid})
      : super(key: key);

  @override
  _LikelihoodCampingState createState() => _LikelihoodCampingState();
}

class _LikelihoodCampingState extends State<LikelihoodCamping>
    with TickerProviderStateMixin {
  AnimationController animationController;
  double likelihoodCampingHeight = 350;
  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CampingProvider>(context).loadLikelihoodCamping(
        widget.cid,widget.campingCity, widget.campingPitchCategories);
    return Consumer<CampingProvider>(builder: (context, provider, _) {
      if (provider.likelihoodCampings != null) {
        if (provider.likelihoodCampings.length == 0)
          likelihoodCampingHeight = 25;
        else
          likelihoodCampingHeight = 175;
        return
            Container(
          height: likelihoodCampingHeight,
          color: AppTheme.getTheme().backgroundColor,
          child: provider.likelihoodCampings.length == 0
          ? noLikelihoodCampingList()
          : ListView.builder(
            itemCount: provider.likelihoodCampings.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(top: 8, bottom: 8),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var count =
                  provider.likelihoodCampings.length > 10 ? 10 : provider.likelihoodCampings.length;
              var animation = Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animationController,
                      curve: Interval((1 / count) * index, 1.0,
                          curve: Curves.fastOutSlowIn)));

              animationController.forward();
              return FavoriteCampingCardListView(
                callback: () {},
                campingData: provider.likelihoodCampings[index],
                animation: animation,
                animationController: animationController,
              );
            },
          ),
          //  ),
        );
      } else
        return Loading();
    });
  }

  Widget noLikelihoodCampingList() {
    return Center(
      child: Text(
        "Nessun campeggio disponibile con queste caratteristiche",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
