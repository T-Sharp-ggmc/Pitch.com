import 'package:WeCanTry/models/campingList.dart';
import 'package:WeCanTry/widgets/starRating.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../appTheme.dart';

class FavoriteCampingCard extends StatefulWidget {
  
  final AnimationController animationController;

  const FavoriteCampingCard({Key key, this.animationController}) : super(key: key);
  
  @override
  _FavoriteCampingCardState createState() => _FavoriteCampingCardState();
}

class _FavoriteCampingCardState extends State<FavoriteCampingCard> {
  var campingList = CampingListDto.campingList.where((i) => i.isFavorite).toList();
  CampingListDto deletedCamping = new CampingListDto();
  @override
  void initState() {
    widget.animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: campingList.length == 0 
        ? noFavoriteList()
        : ListView.builder(
          itemCount: campingList.length,
          padding: EdgeInsets.only(top: 8, bottom: 8),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var count = campingList.length > 10 ? 10 : campingList.length;
            var animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                parent: widget.animationController,
                curve: Interval((1 / count) * index, 1.0,
                    curve: Curves.fastOutSlowIn)));
            widget.animationController.forward();
            return Dismissible(
              key: UniqueKey(),
              background: getDismissedBackground(),
              onDismissed: (direction){
                String nameCampingDismissed = campingList[index].name;
                setState((){
                  campingList[index].isFavorite = !campingList[index].isFavorite;
                   deletedCamping = campingList.removeAt(index);
                });
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("$nameCampingDismissed rimosso dai preferiti"),
                  action: SnackBarAction(
                    label: "INDIETRO",
                    onPressed: () => setState(() => campingList.insert(index, deletedCamping),)
                  ),
                  ));
              },
              child: FavoriteCampingCardListView(
                          callback: () {}, //navigate to details page
                          campingData: campingList[index],
                          animation: animation,
                          animationController: widget.animationController,
              )
            );
          },
        ),
    
    );
  }
}

Widget getDismissedBackground(){
  return Container(
    color: AppTheme.getTheme().errorColor,
    child: Center(
      child: Text(
        "Swipe per togliere dai preferiti",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        )
      ),
    ),
  );
}


Widget noFavoriteList(){
  return Scaffold(
    backgroundColor: AppTheme.getTheme().backgroundColor,
        body: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: () {},
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 0, left: 76, right: 76),
                    child: Image.asset("assets/images/NoFavorite.png"),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      "Nessun campeggio preferito.\n\nInizia una ricerca e clicca sul cuore\nper salvare in preferiti",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              )
              ],
          ),
        ),
    );
}


class FavoriteCampingCardListView extends StatelessWidget {
  final bool isShowDate;
  final VoidCallback callback;
  final CampingListDto campingData;
  final AnimationController animationController;
  final Animation animation;

  const FavoriteCampingCardListView(
      {Key key,
      this.campingData,
      this.animationController,
      this.animation,
      this.callback,
      this.isShowDate: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.getTheme().backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppTheme.getTheme().dividerColor,
                      offset: Offset(4, 4),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  child: AspectRatio(
                    aspectRatio: 2.7,
                    child: Stack(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 0.90,
                              child: Image.asset(
                                campingData.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width >= 360
                                        ? 12
                                        : 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      campingData.name,
                                      maxLines: 2,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      campingData.info,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.withOpacity(0.8)),
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      FontAwesomeIcons
                                                          .mapMarkerAlt,
                                                      size: 12,
                                                      color: AppTheme.getTheme()
                                                          .primaryColor,
                                                    ),
                                                    Text(
                                                      " ${campingData.dist.toStringAsFixed(1)} km dalla città",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.8)),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4),
                                                  child: StarRating(
                                                    allowHalfRating: true,
                                                    starCount: 5,
                                                    rating: campingData.rating,
                                                    size: 20,
                                                    color: AppTheme.getTheme()
                                                        .primaryColor,
                                                    borderColor:
                                                        AppTheme.getTheme()
                                                            .primaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Text(
                                                "€${campingData.perDay}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22,
                                                ),
                                              ),
                                              Text(
                                                "/Al giorno",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey
                                                        .withOpacity(0.8)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: AppTheme.getTheme()
                                .primaryColor
                                .withOpacity(0.1),
                            onTap: () {
                              try {
                                callback();
                              } catch (e) {}
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
