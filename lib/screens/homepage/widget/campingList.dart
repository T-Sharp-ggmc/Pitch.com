import 'package:my_camping/provider/premiumCampingProvider.dart';
import 'package:my_camping/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utilities/appTheme.dart';
import '../../../widgets/campingCard.dart';

class CampingList extends StatefulWidget {
  final AnimationController animationController;

  const CampingList({Key key, this.animationController}) : super(key: key);
  @override
  _CampingListState createState() => _CampingListState();
}

class _CampingListState extends State<CampingList>
    with TickerProviderStateMixin {
  ScrollController scrollController = new ScrollController();
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(children: <Widget>[
                Consumer<PremiumCampingProvider>(
                    builder: (context, provider, _) {
                  if(provider.premiumCampings != null){
                    if (provider.premiumCampings.length != 0) {
                      return Container(
                        color: AppTheme.getTheme().backgroundColor,
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: provider.premiumCampings.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var count = provider.premiumCampings.length > 10
                                ? 10
                                : provider.premiumCampings.length;
                            // provider.campings =
                            //     orderList(_selectedOrder, provider.campings);
                            var animation = Tween(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: animationController,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn)));

                            animationController.forward();
                            return CampingCardListView(
                              animation: animation,
                              animationController: animationController,
                              campingData: provider.premiumCampings[index],
                              callback: refresh,
                            );
                          },
                        ),
                      );
                    }
                    return Container(
                      height: 360,
                      child: SizedBox(),
                    );
                  }
                  else {
                    return Loading();
                  }
                })
              ]),
            ),
          ],
        ),
      )
    ]);
  }

  refresh() {
    setState(() {});
  }
}
